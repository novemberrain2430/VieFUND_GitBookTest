# Hướng dẫn triển khai tài liệu lên GitBook

> Tài liệu này mô tả các bước triển khai **Docs_V2** lên **GitBook** để toàn bộ team có thể truy cập tài liệu kỹ thuật & nghiệp vụ trực tuyến.

---

## Mục lục

1. [Tổng quan](#1-tổng-quan)
2. [Trạng thái chuẩn bị](#2-trạng-thái-chuẩn-bị)
3. [Bước 1 — Push repo lên GitHub](#3-bước-1--push-repo-lên-github)
4. [Bước 2 — Tạo tài khoản & Space trên GitBook](#4-bước-2--tạo-tài-khoản--space-trên-gitbook)
5. [Bước 3 — Kết nối GitBook với Git Repository](#5-bước-3--kết-nối-gitbook-với-git-repository)
6. [Bước 4 — Kiểm tra & Publish](#6-bước-4--kiểm-tra--publish)
7. [Bước 5 — Quy trình cập nhật tài liệu](#7-bước-5--quy-trình-cập-nhật-tài-liệu)
8. [Bước 6 — Cấu hình nâng cao (tuỳ chọn)](#8-bước-6--cấu-hình-nâng-cao-tuỳ-chọn)
9. [Xử lý sự cố thường gặp](#9-xử-lý-sự-cố-thường-gặp)

---

## 1. Tổng quan

**GitBook** hỗ trợ triển khai tài liệu Markdown lên web với 2 cách chính:

| Cách | Mô tả | Phù hợp khi |
|------|--------|-------------|
| **Git Sync** | GitBook tự đồng bộ từ Git repo (GitHub/GitLab) | Team đã dùng Git, muốn auto-deploy |
| **Editor trực tiếp** | Soạn thảo trên giao diện web GitBook | Chỉnh sửa nhanh, không cần Git |

**Khuyến nghị cho VieFundAG**: Dùng **Git Sync** — tài liệu `Docs_V2` đã nằm trong repo, mỗi lần push sẽ tự cập nhật.

---

## 2. Trạng thái chuẩn bị

Các file cần thiết cho GitBook đã được tạo sẵn:

| File | Vị trí | Trạng thái | Mô tả |
|------|--------|------------|-------|
| `README.md` | `Docs_V2/README.md` | ✅ Có sẵn | Trang chủ (landing page) |
| `SUMMARY.md` | `Docs_V2/SUMMARY.md` | ✅ Đã tạo | Sidebar navigation — map toàn bộ cấu trúc |
| `.gitbook.yaml` | Root repo (`/.gitbook.yaml`) | ✅ Đã tạo | Config để GitBook tự nhận root = `Docs_V2` |

### `SUMMARY.md` bao gồm:

- **Getting Started** — System Map, Domain Glossary
- **Topics** — 12 chủ đề nghiệp vụ (Client & KYC, FundServ, Security, ...) + tất cả file con
- **Framework** — 9 guide kỹ thuật + Omnibus (3 trang), PDF Workflow, Signority Workflow
- **Reference** — Data Dictionary, SP Catalog, Screen Catalog, Traceability Matrix
- **Business Logic Topics** — 11 tài liệu legacy
- **Database** — Table Description
- **Tools** — Scripts, samples
- **GitBook** — Hướng dẫn này

### `.gitbook.yaml` nội dung:

```yaml
root: ./Docs_V2/

structure:
  readme: README.md
  summary: SUMMARY.md
```

> File này giúp GitBook tự nhận diện cấu trúc mà **không cần cấu hình thủ công** root directory trên giao diện web.

---

## 3. Bước 1 — Push repo lên GitHub

Đảm bảo cả 2 file mới đã được commit & push:

```bash
git add Docs_V2/SUMMARY.md .gitbook.yaml
git commit -m "docs: add GitBook SUMMARY.md and .gitbook.yaml for deployment"
git push origin main
```

**Kiểm tra trên GitHub**: Vào repo → xác nhận thấy `Docs_V2/SUMMARY.md` và `.gitbook.yaml` ở root.

---

## 4. Bước 2 — Tạo tài khoản & Space trên GitBook

1. Đăng ký tại [gitbook.com](https://www.gitbook.com/) (có thể dùng GitHub để đăng nhập nhanh)
2. Tạo **Organization** cho team (hoặc dùng personal)
3. Nhấn **"Create new space"**
4. Đặt tên: `VieFundAG Technical Docs` (hoặc tên phù hợp)
5. Chọn template **Blank** (ta sẽ import từ Git)

---

## 5. Bước 3 — Kết nối GitBook với Git Repository

### 5.1 Cài đặt GitHub Integration

1. Trong GitBook → vào **Space Settings** (⚙️ góc trên phải)
2. Chọn tab **Integrations**
3. Nhấn **GitHub** → **Install**
4. Cấp quyền cho GitBook truy cập repo `VieFundAG`

### 5.2 Cấu hình Git Sync

1. Quay lại **Space Settings** → **Git Sync**
2. Điền thông tin:

| Cấu hình | Giá trị |
|-----------|---------|
| **Provider** | GitHub (hoặc GitLab) |
| **Repository** | `<org>/VieFundAG` |
| **Branch** | `main` (hoặc branch chứa docs) |
| **Root directory** | `Docs_V2` *(hoặc để trống nếu đã có `.gitbook.yaml`)* |
| **Sync direction** | `GitHub → GitBook` (one-way) hoặc `Bidirectional` |

3. Nhấn **"Synchronize"** để bắt đầu sync

> ⚠️ Vì đã có `.gitbook.yaml` ở root repo, GitBook sẽ **tự động nhận diện** `Docs_V2` là thư mục gốc. Nếu muốn chắc chắn, vẫn có thể điền `Docs_V2` vào ô Root directory.

### 5.3 Chờ đồng bộ

- GitBook sẽ đọc `SUMMARY.md` → tự dựng sidebar navigation
- Toàn bộ `.md` files → render thành các trang web
- Thời gian sync lần đầu: **1-3 phút** tuỳ số lượng file

---

## 6. Bước 4 — Kiểm tra & Publish

### 6.1 Kiểm tra nội dung

Sau khi sync thành công:

1. Mở space trên GitBook → kiểm tra sidebar navigation khớp với `SUMMARY.md`
2. Click qua từng trang → kiểm tra:
   - Nội dung hiển thị đúng Markdown
   - Bảng (table) render đúng
   - Link nội bộ giữa các trang hoạt động
   - Code block hiển thị đúng syntax highlighting
3. Kiểm tra hình ảnh (nếu có) → đảm bảo đường dẫn tương đối đúng

### 6.2 Lưu ý file lớn

Một số file trong repo có dung lượng lớn, có thể ảnh hưởng đến render:

| File | Kích thước | Lưu ý |
|------|-----------|-------|
| `business-logic-topics/repcode-explained.md` | ~576KB | Có thể render chậm |
| `business-logic-topics/ui-checkbox-guide.md` | ~610KB | Có thể render chậm |
| `business-logic-topics/pdf-form-guide.md` | ~228KB | OK |
| `topics/fundserv/v36-requirements.md` | ~605KB | Có thể render chậm |
| `topics/security/red-sentry-report.md` | ~370KB | OK |
| `Database/Table_Description.md` | ~975KB | Có thể cần tách file |

> Nếu file nào render quá chậm hoặc lỗi, cân nhắc tách thành nhiều phần nhỏ hơn.

### 6.3 Publish ra public

1. Vào **Space Settings** → **Visibility**
2. Chọn:
   - **Public** — ai cũng xem được (phù hợp open-source)
   - **Unlisted** — chỉ ai có link mới xem được (khuyến nghị cho internal team)
   - **Private** — chỉ member org xem được (cần GitBook plan trả phí)
3. Nhấn **Save**
4. Copy link share gửi cho team

---

## 7. Bước 5 — Quy trình cập nhật tài liệu

### Workflow hàng ngày

```
Developer chỉnh sửa .md files trong Docs_V2/
    ↓
git add → git commit → git push
    ↓
GitBook tự động sync (trong vòng 1-2 phút)
    ↓
Tài liệu online được cập nhật
```

### Khi thêm trang mới

1. Tạo file `.md` mới trong đúng folder
2. **Cập nhật `SUMMARY.md`** — thêm entry cho trang mới:
   ```markdown
   * [Tên trang mới](path/to/new-page.md)
   ```
   Nếu là trang con (nested):
   ```markdown
   * [Trang cha](topics/fundserv/README.md)
     * [Trang con mới](topics/fundserv/new-page.md)
   ```
3. Commit & push cả 2 file
4. GitBook sẽ tự nhận trang mới và thêm vào sidebar

### Khi xoá hoặc đổi tên trang

1. Xoá/đổi tên file `.md`
2. **Cập nhật `SUMMARY.md`** — xoá/sửa entry tương ứng
3. Commit & push
4. Kiểm tra trên GitBook — trang cũ sẽ trả 404

---

## 8. Bước 6 — Cấu hình nâng cao (tuỳ chọn)

### 8.1 Custom Domain

Nếu muốn dùng domain riêng (vd: `docs.viefund.ca`):

1. Vào **Space Settings** → **Custom Domain**
2. Nhập domain: `docs.viefund.ca`
3. Cấu hình DNS:
   - Thêm **CNAME record**: `docs` → `hosting.gitbook.io`
4. Chờ DNS propagation (tối đa 24h)

### 8.2 Branding

- Vào **Space Settings** → **Customization**
- Upload logo, favicon
- Chọn màu chủ đạo phù hợp branding VieFundAG
- Tuỳ chỉnh header/footer

---

## 9. Xử lý sự cố thường gặp

| Vấn đề | Nguyên nhân | Cách xử lý |
|--------|-------------|-------------|
| Sidebar trống / không đúng | `SUMMARY.md` thiếu hoặc sai cú pháp | Kiểm tra format: `* [Title](path/to/file.md)` |
| Trang hiển thị 404 | File `.md` không tồn tại hoặc đường dẫn sai | Kiểm tra path tương đối trong `SUMMARY.md` |
| Hình ảnh không hiển thị | Đường dẫn ảnh tuyệt đối hoặc sai | Dùng đường dẫn tương đối: `./images/pic.png` |
| Sync không chạy | Branch hoặc root directory sai | Kiểm tra config Git Sync + `.gitbook.yaml` |
| Bảng (table) bị vỡ | Thiếu separator row `\|---\|---\|` | Thêm dòng separator dưới header |
| Emoji/icon không hiển thị | GitBook hỗ trợ chuẩn emoji | Dùng cú pháp `:emoji_name:` hoặc Unicode trực tiếp |
| Folder có dấu cách trong tên | GitBook encode URL | Dùng `%20` trong `SUMMARY.md` (đã xử lý sẵn) |
| File quá lớn (>1MB) | GitBook có giới hạn render | Tách file lớn thành nhiều phần nhỏ hơn |
| `.gitbook.yaml` không nhận | File không nằm ở root repo | Đảm bảo file nằm ở `/` (cùng cấp `Docs_V2/`) |

---

## Checklist triển khai

### Đã hoàn thành (phía repo) ✅

- [x] Tạo file `Docs_V2/SUMMARY.md` — map toàn bộ 80+ trang
- [x] Tạo file `.gitbook.yaml` ở root repo
- [x] Đường dẫn folder có dấu cách đã encode `%20`
- [x] Cấu trúc nested pages (trang con) cho FundServ, Security, Client & KYC, Omnibus, ...

### Cần thực hiện (phía GitBook) 🔲

- [ ] Push commit lên GitHub: `git add . && git commit -m "docs: add GitBook config" && git push`
- [ ] Tạo tài khoản GitBook
- [ ] Tạo Space mới
- [ ] Cài GitHub Integration + cấp quyền
- [ ] Cấu hình Git Sync → nhấn Synchronize
- [ ] Kiểm tra sidebar + nội dung trang
- [ ] Kiểm tra file lớn có render được không
- [ ] Cấu hình visibility (Public/Unlisted/Private)
- [ ] Gửi link cho team
- [ ] (Tuỳ chọn) Cấu hình custom domain
- [ ] (Tuỳ chọn) Cấu hình branding

---

> **Liên hệ**: Nếu gặp vấn đề khi triển khai, tham khảo [GitBook Documentation](https://docs.gitbook.com/) hoặc liên hệ người quản lý dự án.
