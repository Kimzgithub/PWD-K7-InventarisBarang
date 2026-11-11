#PWD-K7-InventarisBarang

Kelompok 7:
- Khairunisa Ansyari Ramadhan H110121057
- Riko H1101251065
- LUQMANURHAKIM H1101251067
- Charles Wong H1101251012


Proyek Pertemuan 14, Pemrograman Web Dasar (Universitas Tanjungpura).

```
proyek-pwd-kelompok/
├── database/inventaris.sql   ← skema + 5 data awal
├── backend/                  ← Express + MySQL (REST API CRUD)
└── frontend/                 ← Vue 3 + Vue Router + Axios + Tailwind CSS 3
```

## 1. Database
Buka phpMyAdmin / MySQL CLI lalu jalankan isi `database/inventaris.sql`.
Hasil: database `db_inventaris` dengan tabel `barang` berisi 5 baris.

## 2. Backend
```bash
cd backend
npm install
npm run dev        # → http://localhost:3000
```
Sesuaikan kredensial MySQL di `backend/.env` bila perlu.

Test: `http://localhost:3000/api/barang`

| Method | Endpoint | Operasi |
|--------|----------|---------|
| GET | /api/barang | Ambil semua |
| GET | /api/barang/:id | Ambil satu |
| POST | /api/barang | Tambah |
| PUT | /api/barang/:id | Ubah |
| DELETE | /api/barang/:id | Hapus |

## 3. Frontend
```bash
cd frontend
npm install
npm run dev        # → http://localhost:5173
```
URL API diatur di `frontend/.env` (`VITE_API_URL`).

Jalankan backend dan frontend di dua terminal terpisah, lalu buka http://localhost:5173.
