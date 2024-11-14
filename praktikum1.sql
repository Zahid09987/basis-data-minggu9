CREATE DATABASE praktikum;

DROP DATABASE praktikum;

USE praktikum;

-- Praktikum 1

-- 1.

-- Create table for Jurusan
CREATE TABLE jurusan (
    kode_jurusan VARCHAR(4) PRIMARY KEY,
    nama_jurusan VARCHAR(50),
    ketua_jurusan VARCHAR(50)
);

DESCRIBE jurusan;

ALTER TABLE jurusan ADD total_mahasiswa INT;

-- Insert data into Jurusan table
INSERT INTO jurusan (kode_jurusan, nama_jurusan, ketua_jurusan) VALUES
('KD01', 'Sistem Informasi', 'Harnaningrum, S.Si'),
('KD02', 'Teknik Informatika', 'Enny Sela, S.Kom., M.Kom'),
('KD03', 'Tekhnik Komputer', 'Berta Bednar, S.Si M.T.');

-- Create table for Biodata
CREATE TABLE biodata (
    no_mahasiswa INT PRIMARY KEY,
    kode_jurusan VARCHAR(4),
    nama_mahasiswa VARCHAR(50),
    alamat VARCHAR(50),
    ipk DECIMAL(3,2)
);

ALTER TABLE biodata MODIFY kode_jurusan VARCHAR(5);

-- Insert data into Biodata table
INSERT INTO biodata (no_mahasiswa, kode_jurusan, nama_mahasiswa, alamat, ipk) VALUES
(210089, 'KD01', 'Rina Gunawan', 'Denpasar', 3.0),
(210090, 'KD03', 'Gani Suprapto', 'Singaraja', 3.5),
(210012, 'KD02', 'Alexandra', 'Nusa Dua', 3.0),
(210099, 'KD02', 'Nadine', 'Gianyar', 3.2),
(210002, 'KD01', 'Rizal Samurai', 'Denpasar', 3.7);

-- 2.

-- Tambahkan kode jurusan "KD04" di tabel jurusan terlebih dahulu
INSERT INTO jurusan (kode_jurusan, nama_jurusan, ketua_jurusan) VALUES
('KD04', 'Teknik Sipil', 'Dr. Ir. Agus Wijaya, S.T., M.T.');

-- Masukkan data baru ke tabel biodata dengan kode jurusan "KD04"
INSERT INTO biodata (no_mahasiswa, kode_jurusan, nama_mahasiswa, alamat, ipk) VALUES
(210100, 'KD04', 'Lukman Hakim', 'Badung', 3.4);

-- 3.

-- Mengganti nama mahasiswa "Rina Gunawan" menjadi "Rina Gunawan Astuti"
UPDATE biodata
SET nama_mahasiswa = 'Rina Gunawan Astuti'
WHERE nama_mahasiswa = 'Rina Gunawan';

-- Mengganti kode jurusan pada tabel jurusan "KD01" menjadi "KM01"
UPDATE jurusan
SET kode_jurusan = 'KM01'
WHERE kode_jurusan = 'KD01';

-- Mengganti kode jurusan pada tabel biodata yang berhubungan dengan "KD01" menjadi "KM01"
UPDATE biodata
SET kode_jurusan = 'KM01'
WHERE kode_jurusan = 'KD01';

-- Mengganti nomor mahasiswa "210089" menjadi "210098"
UPDATE biodata
SET no_mahasiswa = 210098
WHERE no_mahasiswa = 210089;

-- Mengganti nilai pada tabel biodata "3" menjadi "3.3"
UPDATE biodata
SET ipk = 3.3
WHERE ipk = 3.0;

-- Mengganti kode jurusan pada tabel biodata "KD03" menjadi "KD05"
UPDATE jurusan
SET kode_jurusan = 'KD05'
WHERE kode_jurusan = 'KD03';

-- Mengganti kode jurusan pada tabel biodata yang berhubungan dengan "KD03" menjadi "KD05"
UPDATE biodata
SET kode_jurusan = 'KD05'
WHERE kode_jurusan = 'KD03';

-- 4. Kesimpulan

-- 1.	Penambahan Data: Pada nomor 2, kita berhasil menambahkan data baru pada tabel biodata dengan kode_jurusan “KD04”. Sebelumnya, kita harus memastikan bahwa kode jurusan “KD04” tersedia di tabel jurusan.
-- 2.	Perubahan Data: Pada nomor 3, kita melakukan beberapa perubahan pada data yang sudah ada:
-- •	Mengganti nama mahasiswa.
-- •	Mengubah kode jurusan pada tabel jurusan, yang juga perlu diperbarui di tabel biodata agar relasi tetap konsisten.
-- •	Mengubah nomor mahasiswa.
-- •	Mengganti nilai IPK.
-- •	Mengganti kode jurusan lain di kedua tabel untuk menjaga konsistensi data.

-- Praktikum 2

-- Menggunakan CROSS JOIN
SELECT jurusan.kode_jurusan, jurusan.nama_jurusan, biodata.no_mahasiswa, biodata.nama_mahasiswa 
FROM jurusan
CROSS JOIN biodata;

-- Atau dengan notasi tanpa ON
SELECT jurusan.kode_jurusan, jurusan.nama_jurusan, biodata.no_mahasiswa, biodata.nama_mahasiswa 
FROM jurusan, biodata;

SELECT jurusan.kode_jurusan, jurusan.nama_jurusan, biodata.no_mahasiswa, biodata.nama_mahasiswa
FROM jurusan
INNER JOIN biodata
ON jurusan.kode_jurusan = biodata.kode_jurusan;

SELECT jurusan.kode_jurusan, jurusan.nama_jurusan, biodata.no_mahasiswa, biodata.nama_mahasiswa 
FROM jurusan
LEFT JOIN biodata
ON jurusan.kode_jurusan = biodata.kode_jurusan;

SELECT jurusan.kode_jurusan, jurusan.nama_jurusan, biodata.no_mahasiswa, biodata.nama_mahasiswa 
FROM jurusan
RIGHT JOIN biodata
ON jurusan.kode_jurusan = biodata.kode_jurusan;

-- 2. Kesimpulan: Perbedaan antara RIGHT JOIN dan LEFT JOIN

-- • LEFT JOIN: Menampilkan semua baris dari tabel kiri, dan hanya baris yang cocok dari tabel kanan. Jika tidak ada kecocokan, kolom dari tabel kanan akan berisi NULL.
-- • RIGHT JOIN: Menampilkan semua baris dari tabel kanan, dan hanya baris yang cocok dari tabel kiri. Jika tidak ada kecocokan, kolom dari tabel kiri akan berisi NULL.

-- Praktikum 3

-- 1
SELECT LOWER(nama_mahasiswa) AS nama_kecil
FROM biodata;

SELECT UPPER(nama_jurusan) AS nama_besar
FROM jurusan;

SELECT SUBSTRING(nama_mahasiswa, 2, 4) AS ambil_karakter
FROM biodata;

SELECT LTRIM(alamat) AS hapus_spasi
FROM biodata;

SELECT RTRIM(alamat) AS hapus_spasi
FROM biodata;

SELECT RIGHT(nama_mahasiswa, 3) AS ambil_karakter
FROM biodata;

SELECT LEFT(nama_jurusan, 3) AS ambil_karakter
FROM jurusan;

SELECT nama_mahasiswa, LENGTH(nama_mahasiswa) AS panjang
FROM biodata;

SELECT nama_mahasiswa, REVERSE(nama_mahasiswa) AS balik
FROM biodata;

SELECT CONCAT(SPACE(10), nama_jurusan) AS nama_jurusan_dengan_spasi
FROM jurusan;

-- Praktikum 4

-- 1.
SELECT AVG(ipk) AS rata_rata_ipk
FROM biodata;

SELECT COUNT(*) AS jumlah_mahasiswa
FROM biodata;

SELECT SUM(ipk) AS total_ipk
FROM biodata;

SELECT MAX(ipk) AS ipk_tertinggi
FROM biodata;

SELECT MIN(ipk) AS ipk_terendah
FROM biodata;

-- 2.
SELECT * FROM biodata
ORDER BY nama_mahasiswa ASC;

SELECT * FROM biodata
ORDER BY ipk DESC;

SELECT kode_jurusan, COUNT(*) AS jumlah_mahasiswa
FROM biodata
GROUP BY kode_jurusan;

SELECT kode_jurusan, AVG(ipk) AS rata_rata_ipk
FROM biodata
GROUP BY kode_jurusan
HAVING AVG(ipk) > 3.2;

-- Praktikum 5

-- 1.
SELECT no_mahasiswa, nama_mahasiswa, alamat, ipk
FROM biodata
WHERE ipk = (SELECT MAX(ipk) FROM biodata);

SELECT no_mahasiswa, nama_mahasiswa, alamat, ipk
FROM biodata
WHERE ipk = (SELECT MIN(ipk) FROM biodata);

SELECT kode_jurusan, nama_jurusan, ketua_jurusan
FROM jurusan
WHERE kode_jurusan IN (SELECT kode_jurusan FROM biodata WHERE ipk > 3.5);

SELECT nama_mahasiswa AS nama, alamat AS lokasi
FROM biodata
UNION
SELECT nama_jurusan AS nama, ketua_jurusan AS lokasi
FROM jurusan;

SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE ipk > 3.0
UNION ALL
SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE alamat = 'Denpasar';

-- 2.
SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE ipk > 3.0
AND alamat = 'Denpasar';

SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE ipk > 3.0
UNION
SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE alamat = 'Denpasar';

SELECT no_mahasiswa, nama_mahasiswa, ipk
FROM biodata
WHERE ipk > 3.0
AND alamat <> 'Denpasar';

-- 3.
-- • INTERSECT digunakan untuk mengambil data yang memenuhi kedua kondisi, yaitu data yang ada di kedua tabel atau subset data yang sesuai dengan kedua kondisi.
-- • EXCEPT digunakan untuk mengambil data yang memenuhi kondisi di tabel pertama tetapi tidak memenuhi kondisi di tabel kedua.
-- • UNION menggabungkan data dari dua query dan menghilangkan duplikat.
-- • UNION ALL menggabungkan data dari dua query tanpa menghilangkan duplikat.

-- Praktikum 6

-- 1.
-- • Mempermudah query yang kompleks dengan menyederhanakannya menjadi satu entitas yang bisa digunakan berulang kali.
-- • Meningkatkan keamanan data, karena hanya menampilkan data yang diperlukan dan menyembunyikan kolom atau data sensitif.
-- • Membantu dalam pemeliharaan database dengan memisahkan query-query khusus dalam sebuah view tanpa mengubah struktur tabel utama.
-- • Menyederhanakan akses terhadap data dari beberapa tabel.

-- 2.
CREATE VIEW laporan_mahasiswa AS
SELECT biodata.no_mahasiswa, biodata.nama_mahasiswa, jurusan.nama_jurusan, biodata.alamat
FROM biodata
JOIN jurusan ON biodata.kode_jurusan = jurusan.kode_jurusan;

SELECT * FROM laporan_mahasiswa;

-- 3.
SELECT no_mahasiswa, nama_mahasiswa,
IF(ipk > 3.5, 'Lulus dengan Pujian', 'Lulus') AS status_kelulusan
FROM biodata;

SELECT IFNULL(
    (SELECT nama_mahasiswa FROM biodata WHERE no_mahasiswa = '210001'),
    'Tidak Diketahui') AS hasil;
    
SELECT NULLIF(
    (SELECT nama_mahasiswa FROM biodata WHERE no_mahasiswa = '210001'),
    'Dewi') AS hasil;
    
SELECT no_mahasiswa, nama_mahasiswa, ipk,
CASE
    WHEN ipk >= 3.5 THEN 'Sangat Baik'
    WHEN ipk >= 3.0 THEN 'Baik'
    WHEN ipk >= 2.5 THEN 'Cukup'
    ELSE 'Kurang'
END AS kategori_ipk
FROM biodata;

CREATE TEMPORARY TABLE tempmahasiswa (
    no_mahasiswa INT PRIMARY KEY,
    nama_mahasiswa VARCHAR(80),
    alamat VARCHAR(50),
    hobby VARCHAR(70)
);

INSERT INTO tempmahasiswa (no_mahasiswa, nama_mahasiswa, alamat, hobby)
VALUES (210001, 'Andi Setiawan', 'Surabaya', 'Membaca');

SELECT * FROM tempmahasiswa;

-- Praktikum 7

-- 1.
DELIMITER //
CREATE PROCEDURE lihat_mahasiswa_dari_ketua (IN nama_ketua VARCHAR(50))
BEGIN
    SELECT biodata.no_mahasiswa, biodata.nama_mahasiswa, jurusan.nama_jurusan, jurusan.ketua_jurusan
    FROM biodata
    JOIN jurusan ON biodata.kode_jurusan = jurusan.kode_jurusan
    WHERE jurusan.ketua_jurusan = nama_ketua;
END; //
DELIMITER ;

CALL lihat_mahasiswa_dari_ketua('Dr. Susilo');

-- 2.
DELIMITER //
CREATE PROCEDURE cari_ketua_jurusan (IN nama_ketua VARCHAR(50))
BEGIN
    SELECT kode_jurusan, nama_jurusan, ketua_jurusan
    FROM jurusan
    WHERE ketua_jurusan LIKE CONCAT('%', nama_ketua, '%');
END; //
DELIMITER ;

CALL cari_ketua_jurusan('Susilo');

-- 3.
DELIMITER //
CREATE TRIGGER update_total_mahasiswa
AFTER INSERT ON biodata
FOR EACH ROW
BEGIN
    UPDATE jurusan
    SET jurusan.total_mahasiswa = jurusan.total_mahasiswa + 1
    WHERE jurusan.kode_jurusan = NEW.kode_jurusan;
END; //
DELIMITER ;

INSERT INTO biodata (no_mahasiswa, nama_mahasiswa, kode_jurusan, alamat, ipk)
VALUES ('210010', 'Rina Kusuma', 'JUR01', 'Jakarta', 3.2);

-- 4.
-- • Stored Procedure:
-- 		• Tidak harus mengembalikan nilai, namun bisa mengembalikan nilai melalui parameter OUT.
-- 		• Biasanya digunakan untuk menjalankan satu atau lebih perintah SQL secara bersamaan.
-- 		• Bisa menjalankan operasi kompleks, termasuk DML (Data Manipulation Language) seperti INSERT, UPDATE, DELETE.
-- 		• Dipanggil dengan perintah CALL.
-- • Function:
-- 		• Harus mengembalikan nilai dengan menggunakan klausa RETURN.
-- 		• Umumnya digunakan untuk melakukan kalkulasi atau operasi yang mengembalikan satu nilai.
-- 		• Tidak dapat melakukan operasi DML (INSERT, UPDATE, DELETE) pada tabel di dalamnya.
-- 		• Dipanggil langsung dalam query, misalnya SELECT