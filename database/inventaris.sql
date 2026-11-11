-- ============================================
-- DATABASE INVENTARIS BARANG (Kelompok 1)
-- ============================================
CREATE DATABASE IF NOT EXISTS db_inventaris
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE db_inventaris;

-- Tabel barang
CREATE TABLE barang (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kode_barang VARCHAR(50) UNIQUE NOT NULL,
  nama_barang VARCHAR(150) NOT NULL,
  kategori VARCHAR(100),
  harga DECIMAL(12,2) NOT NULL,
  stok INT NOT NULL DEFAULT 0,
  satuan VARCHAR(20) DEFAULT 'pcs',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Data awal
INSERT INTO barang (kode_barang, nama_barang, kategori, harga, stok, satuan) VALUES
('BRG-001', 'Laptop Asus Vivobook', 'Elektronik', 7500000, 10, 'unit'),
('BRG-002', 'Mouse Logitech M170', 'Aksesoris', 85000, 50, 'pcs'),
('BRG-003', 'Keyboard Mechanical', 'Aksesoris', 350000, 20, 'pcs'),
('BRG-004', 'Monitor LG 24 inch', 'Elektronik', 1800000, 5, 'unit'),
('BRG-005', 'Kabel HDMI 2m', 'Aksesoris', 45000, 100, 'pcs');
