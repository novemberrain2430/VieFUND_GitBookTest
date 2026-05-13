# Troubleshooting & Debug — VFOmnibus

Hướng dẫn xử lý sự cố, các lỗi thường gặp, và những điểm cần lưu ý khi bảo trì module Omnibus.

---

## 1. Code Smells & Known Issues

### 1.1. Biến `errorMessage` / `errorCode` bị khai báo nhưng không sử dụng

Nhiều method khai báo `errorMessage` và `errorCode` local nhưng không trả về hoặc log:

```csharp
// ❌ Pattern lặp lại nhiều lần
public static DataSet SomeMethod(...)
{
    string errorMessage = "";   // local variable
    int errorCode = 0;          // local variable
    // ...
    catch (Exception ex)
    {
        errorMessage = ex.Message;  // gán nhưng...
        errorCode = 1;              // ...không return
    }
    // Method trả về null DataSet, caller không biết lý do lỗi
}
```

**Ảnh hưởng**: Khi DB lỗi hoặc SP throw exception, UI chỉ nhận `null` DataSet mà không có error message. User thấy danh sách trống, không hiểu tại sao.

**Nơi xảy ra** (ví dụ):
- `WeeklyList()` — line 24-25 trong OMReport.cs
- `MonthlyList()` — line 74-75
- `OmnibusDividendTrxInfo()` — line 1396-1397

**Phân biệt**: Một số method **có** `ref string errorMessage, ref int errorCode` trong signature — những method này trả lỗi đúng cách. Vấn đề chỉ ở các method dùng **local** variables.

**Cách fix nếu cần**:
```csharp
// Thêm logging tối thiểu
catch (Exception ex)
{
    errorMessage = ex.Message;
    errorCode = 1;
    System.Diagnostics.Debug.WriteLine($"VFOmnibus error: {ex.Message}");
    // hoặc log vào Event Viewer / file log
}
```

---

### 1.2. `db = null` sau `finally` block là thừa

```csharp
finally
{
    if (db != null)
        db.Close();
}
db = null;  // ← Thừa — db ra khỏi scope ngay sau return
```

**Ảnh hưởng**: Không gây lỗi, chỉ là dead code. Pattern lặp lại ở **mọi method** trong toàn project (~80+ lần).

---

### 1.3. `Result.Tables.Clear()` ngay sau `new DataSet()` là thừa

```csharp
DataSet Result = new DataSet();
Result.Tables.Clear();  // ← DataSet mới tạo, không có table nào
```

**Ảnh hưởng**: Không gây lỗi, chỉ là defensive coding thừa.

---

### 1.4. `SynchronizeDividendSelectedItem` — Marked "not in use"

```csharp
// not in use
public static int SynchronizeDividendSelectedItem(...)
```

Dòng 1287-1332 trong Omnibus.cs. Method này tồn tại nhưng không có caller nào.

**Đánh giá**: YAGNI — có thể xóa nếu muốn giảm code surface. Tuy nhiên, SP `OMDividendTrxSynchSelected` vẫn có thể đang được dùng từ chỗ khác.

---

### 1.5. Duplicate SP Call: `OmnibusTrxMergeLOI` vs `OmnibusOrderMerge`

Hai method khác nhau gọi **cùng SP** `OMOmnibusMergeTrxOneDay`:

```csharp
// Method 1 — trả DataSet (preview)
public static DataSet OmnibusTrxMergeLOI(...) → SP: OMOmnibusMergeTrxOneDay → FillDataSet

// Method 2 — trả int (execute)  
public static int OmnibusOrderMerge(...) → SP: OMOmnibusMergeTrxOneDay → ExecuteSQL
```

**Giải thích**: Method 1 dùng cho preview (xem trước kết quả merge), Method 2 dùng để thực sự thực hiện merge. Cả hai gọi cùng SP nhưng khác `iOptions`. Đây là design có chủ đích, KHÔNG phải bug.

---

### 1.6. Thread.Abort() trong AccountCompare

```csharp
public void AbortProcessing()
{
    if (m_Thread != null)
    {
        m_Thread.Abort();  // ⚠️ Thread.Abort() is deprecated in .NET Core
        m_Thread = null;
    }
}
```

**Ảnh hưởng**: 
- Hiện tại chạy trên .NET Framework 4.5 nên vẫn hoạt động
- Nếu migrate sang .NET Core/5+ sẽ throw `PlatformNotSupportedException`
- `Thread.Abort()` có thể để lại resource leak

**Nếu cần migrate**: Thay bằng `CancellationToken` pattern.

---

### 1.7. ThreadPriority.Highest trong AccountCompare

```csharp
m_Thread.Priority = ThreadPriority.Highest;
```

**Ảnh hưởng**: Có thể gây resource starvation cho các thread khác trong IIS process. Account Compare là operation nặng (loop qua tất cả fund positions), chạy ở priority Highest có thể ảnh hưởng performance tổng thể.

**Recommendation**: Đổi sang `ThreadPriority.Normal` hoặc `BelowNormal`.

---

## 2. Debugging Scenarios

### 2.1. Omnibus order không hiện trên danh sách

**Triệu chứng**: User tạo omnibus order nhưng không thấy trong danh sách pending.

**Debug**:
1. Kiểm tra `iOrderStatus` đang filter — tab Pending dùng status khác tab History
2. Kiểm tra `MgmtCode` và `FundID` filter trên UI — nếu có filter sẽ ẩn records
3. Chạy SP trực tiếp:
   ```sql
   EXEC OMOmnibusOrderPendingSet 
       @iUserID = <user_id>, @Lg = 1, @iOrderStatus = 0,
       @iPageSize = 50, @iPage = 0, @iOptions = 0
   ```
4. Kiểm tra DSID — mỗi dealer source có data riêng

---

### 2.2. Đồng bộ (Synch) không cập nhật client transactions

**Triệu chứng**: Sau khi Synch, client transactions không được cập nhật trong `UB_FundTrx`.

**Debug**:
1. Kiểm tra `iRet` từ `SynchronizeTaggedItems()` — giá trị > 0 = lỗi
2. Kiểm tra SP `OMOmnibusSynchTaggedItems`:
   - `iCountDone` = số items đã xử lý
   - `iCount` = tổng items
   - `iTrxCount` = số client trx created/updated
3. Nếu `iTrxCount = 0` nhưng `iCountDone > 0`: SP có thể skip do status mismatch
4. Kiểm tra bảng `OM_OmnibusTrxDetail` — cần có mapping giữa omnibus trx và client

---

### 2.3. Dividend breakage quá lớn

**Triệu chứng**: Sau khi phân bổ cổ tức, breakage unit > threshold.

**Debug**:
1. Kiểm tra `fBreakageUnitMax` được truyền vào `OMDividendTrxProcess`
2. UI control: `idBreakageUnitMax` trên OmnibusView
3. Kiểm tra `fDividendRate` — rate sai sẽ gây breakage lớn
4. Method 2 (theo khoảng thời gian) phức tạp hơn — kiểm tra `DateFrom`, `DateTo`, `iTrxTypeOpt`
5. Dùng `OmnibusDividendTrxInfoX` để xem chi tiết phân bổ trước khi process

---

### 2.4. Reversal (REV) thất bại

**Triệu chứng**: Reversal process trả `iRet > 0`.

**Debug**:
1. `REVTrxProcessOneItem` trả error message tại `db.GetStr("ErrorMsg", "")` — đọc message này
2. Kiểm tra original transaction status — chỉ có thể reverse trx ở trạng thái certain
3. Kiểm tra `TrxList` format — phải là comma-separated IDs
4. Nếu dùng `bConfirm = true` trong `OmnibusREVProcessPendingFromTrxList`: đảm bảo data đã được review

---

### 2.5. Account Compare chạy quá lâu / không finish

**Triệu chứng**: Progress bar dừng hoặc không đến 100%.

**Debug**:
1. Kiểm tra `m_Abort` — nếu user abort, loop sẽ break sớm
2. Step 1 (`OMAccountCompareStep1`) trả `iTotal` — nếu rất lớn, quá trình sẽ lâu
3. Step 2 loop: mỗi iteration gọi `OMAccountCompareStep2` — nếu SP chậm, tổng thời gian = iTotal × SP time
4. Kiểm tra `bRecalc`:
   - `true` + `iFundPosID > 0` = chỉ recalc 1 fund position (nhanh)
   - `true` + `iFundPosID = 0` = recalc tất cả (chậm)
   - `false` = dùng data đã cache (nhanh nhất)
5. `FinishCallback` không được gọi? Kiểm tra exception trong `GenerateReport()` — nếu Step 1 fail (`iRet != 1` hoặc `iTotal == 0`), callback vẫn được gọi với `iRet`

---

### 2.6. Excel export trống ("No record found")

**Triệu chứng**: File Excel download chỉ có "No record found".

**Debug**:
1. Kiểm tra `iOptions = 3` — đây là convention cho export mode. Nếu truyền sai options, SP có thể trả data khác
2. Kiểm tra DataSet có chứa table đúng tên hay không:
   ```csharp
   // Ví dụ: ExcelTrxDetail() tìm "HeaderS", "HeaderD", "Summary", "DetailList"
   // Nếu SP thay đổi RecType, tên table sẽ khác
   ```
3. Kiểm tra `iOmnibusTrxID > 0 || iShowOpt != 1` — nếu cả hai điều kiện false, method trả "No record found" luôn
4. Table Header phải match: `ds.Tables.Contains("Header")` — RecType trong SP phải trả đúng

---

## 3. Các bước thêm chức năng mới

### 3.1. Thêm filter mới vào danh sách

1. **UI** (OmnibusView.aspx): Thêm control (TextBox/DropDown)
2. **Code-behind** (OmnibusView.aspx.cs): Đọc giá trị control, truyền vào method
3. **VFOmnibus**: Thêm parameter vào method signature
4. **Method body**: Thêm `db.AddParam("NewParam", value)` — có thể conditional:
   ```csharp
   if (newValue.Length > 0)
       db.AddParam("NewParam", newValue);
   ```
5. **SP**: Thêm `@NewParam` vào stored procedure

### 3.2. Thêm Excel export mới

Follow pattern từ các Excel methods hiện có:

```csharp
public static bool ExcelNewReport(Page p, string DBIDStr, string DSIDStr,
    int iUserID, int Lg, string FileName, /* extra params */)
{
    string ContentStr = "";
    DataTable tbHeader = null, tbData = null;
    string tbHeaderName = "Header";   // ← phải match RecType từ SP
    string tbName = "DataList";       // ← phải match RecType từ SP
    string errorMessage = "";
    int errorCode = 0;

    // 1. Gọi method lấy data với iOptions = 3
    DataSet ds = GetNewDataSet(..., iOptions: 3);
    
    // 2. Tìm tables
    if (ds != null && ds.Tables.Contains(tbHeaderName))
        tbHeader = ds.Tables[tbHeaderName];
    if (ds != null && ds.Tables.Contains(tbName))
        tbData = ds.Tables[tbName];
    
    // 3. Convert và gửi
    ContentStr = CBase.TableToExcel(tbData, tbHeader, ",", true);
    if (ContentStr.Length == 0)
        ContentStr = "No record found";
    CBase.TextToExcel(p, "", ContentStr, FileName);
    return true;
}
```

### 3.3. Thêm Selection (Tag/Untag) pattern mới

1. Tạo SP mới tương tự `OMOrderSelectionUpdate`:
   - Input: `@iUserID`, `@iItemID`, `@bSelect`, `@bAll`
   - Output: DataSet với updated selection state
2. Thêm method C# theo pattern:
   ```csharp
   public static DataSet NewSelectionUpdate(string DBIDStr, string DSIDStr, 
       int iUserID, int iItemID, bool bSelect, bool bAll, int iSP)
   {
       string SPName = "OMNewSelectionUpdate";
       // ... (copy từ OmnibusOrderPendingSelectionUpdate)
   }
   ```
3. UI: Gọi method qua button click / checkbox change

---

## 4. Cấu hình & Dependencies

### Build Output

```xml
<!-- VFOmnibus.csproj -->
<OutputPath>..\..\WebApp\bin\</OutputPath>
```

DLL build trực tiếp vào `WebApp/bin/`. Nếu thay đổi code, phải rebuild VFOmnibus **trước** khi test WebApp.

### Dependencies

| DLL | Vai trò | Vị trí |
|-----|---------|--------|
| `UBClass.dll` | Utilities: `CBase`, `CFunctions`, `CMSG` | `WebApp/bin/` |
| `UBConnection.dll` | `CDatabase` — DB access layer | `WebApp/bin/` |
| `UBStatic.dll` | Shared constants | `WebApp/bin/` |

### IIS Considerations

- Account Compare chạy background thread — IIS có thể recycle app pool giữa chừng
- Thread.Abort() sẽ fire khi app pool recycle
- Nếu Account Compare hay bị timeout: kiểm tra IIS app pool idle timeout settings

---

## 5. Quick Reference — Error Codes

| iRet | Ý nghĩa |
|------|---------|
| `0` | Thành công |
| `1` | SQL execution failed (`ExecuteSQL` trả != 1) |
| `2` | Exception caught (xem `errorMessage`) |
| `> 0` (từ SP) | SP-specific error — kiểm tra SP logic |

| errorCode | Ý nghĩa |
|-----------|---------|
| `0` | Không lỗi |
| `1` | Exception caught |
| `2` | SQL execution failed (chỉ ở một số method REV) |

---

## 6. Checklist khi Debug

- [ ] Kiểm tra `DBIDStr` và `DSIDStr` — đúng dealer source?
- [ ] Kiểm tra `iUserID` — user có quyền truy cập module Omnibus?
- [ ] Kiểm tra filter trên UI (MgmtCode, FundID, Status, DateRange)
- [ ] Chạy SP trực tiếp trong SSMS với cùng parameters
- [ ] Kiểm tra `RecType` giá trị — table name phải match expected name
- [ ] Kiểm tra `iOptions` — đặc biệt `3` cho export mode
- [ ] Kiểm tra Event Viewer cho unhandled exceptions trong IIS
- [ ] Kiểm tra WebApp bin folder — `VFOmnibus.dll` có phải bản mới nhất?
