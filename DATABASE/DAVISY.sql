﻿USE master

CREATE DATABASE DAVISY
USE DAVISY

CREATE TABLE LOAIHANG(
	MALH NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENLH NVARCHAR(50) NOT NULL
)

CREATE TABLE HANG(
	MAHANG NVARCHAR(10) NOT NULL PRIMARY KEY,
	TEHANG NVARCHAR(50) NOT NULL,
)

CREATE TABLE SANPHAM(
	MASP NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENSP NVARCHAR(50) NOT NULL,
	MALH NVARCHAR(10) NOT NULL,
	MAHANG NVARCHAR(10) NOT NULL,
	GIANHAP FLOAT NOT NULL,
	GIABAN FLOAT NOT NULL,
	NGAYNHAP DATE NOT NULL,
	HINH NVARCHAR(50) NOT NULL,
)

CREATE TABLE KHACHHANG(
	MAKH NVARCHAR(10) NOT NULL PRIMARY KEY,
	HOTEN NVARCHAR(30) NOT NULL,
	DIENTHOAI NVARCHAR(20) NOT NULL
)

CREATE TABLE HOADON(
	MAHD NVARCHAR(10) NOT NULL PRIMARY KEY,
	MAKH NVARCHAR(10) NOT NULL,
	TENDN NVARCHAR(30) NOT NULL,
	NGAYLAP DATE NOT NULL,
	TONGTIEN FLOAT NOT NULL
)

CREATE TABLE GIOHANG(
	MAHD NVARCHAR(10) NOT NULL,
	MASP NVARCHAR(10) NOT NULL,
	SOLUONG INT NOT NULL
)

CREATE TABLE TAIKHOAN(
	TENDN NVARCHAR(30) NOT NULL PRIMARY KEY,
	TENNV NVARCHAR(30) NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	MATKHAU NVARCHAR(30) NOT NULL,
	VAITRO BIT NOT NULL
)

CREATE TABLE CHUONGTRINHGIAMGIA(
	MAGG NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENGG NVARCHAR(30) NOT NULL,
	PHANTRAMGIAM FLOAT NOT NULL,
	NGAYBATDAU DATE NOT NULL,
	NGAYKETTHUC DATE NOT NULL,
	PHAMVI NVARCHAR (10) NOT NULL
)

ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_LOAIHANG FOREIGN KEY (MALH) REFERENCES LOAIHANG(MALH);
ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_HANG FOREIGN KEY (MAHANG) REFERENCES HANG(MAHANG);

ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_HOADON FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP);

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_TAIKHOAN FOREIGN KEY (TENDN) REFERENCES TAIKHOAN(TENDN);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);


INSERT INTO LOAIHANG VALUES
	(N'TN', N'Tai nghe'),
	(N'CSDP', N'Cục sạc dự phòng'),
	(N'BP', N'Bàn phím'),
	(N'LC', N'Lót chuột'),
	(N'GDLT', N'Giá đỡ laptop')

INSERT INTO HANG VALUES
	(N'SS', N'SAMSUNG'),
	(N'SN', N'SONY'),
	(N'IP', N'IPHONE'),
	(N'PM', N'Pé Mỡ'),
	(N'CC', N'Chúc chích')


INSERT INTO SANPHAM VALUES
	(N'SP01', N'Tai nghe AirPod siêu cấp vip pro', N'TN', N'IP', 1000000, 120000, CAST('7-11-2022' AS DATE), 'TN.PNG'),
	(N'SP02', N'Cục sạc dự phòng siêu cấp vip pro Pé Mỡ', N'CSDP', N'PM', 300000, 400000, CAST('7-11-2022' AS DATE), 'TN.PNG'),
	(N'SP03', N'Bàn phím siêu cấp vip pro Chúc chích', N'BP', N'CC', 700000, 800000, CAST('7-11-2022' AS DATE), 'TN.PNG'),
	(N'SP04', N'Lót chuột siêu cấp vip pro in hình idol Đạt Villa', N'LC', N'PM', 30000, 50000, CAST('7-11-2022' AS DATE), 'TN.PNG'),
	(N'SP05', N'Giá đỡ laptop siêu cấp vip pro bằng sứ', N'GDLT', N'SN', 500000, 600000, CAST('7-11-2022' AS DATE), 'TN.PNG')

	
INSERT INTO TAIKHOAN VALUES
	(N'DangTH', N'Trần Hữu Đang', 'dangthpc04349', '123',  1),
	(N'VinhPQ', N'Phùng Quốc Vinh', 'vinhpqpc04338', '123', 0),
	(N'DanNK', N'Nguyễn Khánh Đan', 'dannkpc04351', '123', 0),
	(N'SyDH', N'Đoàn Hiệp Sỹ', 'sydhpc04388', '123', 0),
	(N'ViLB', N'Lê Bích Vi', 'vilbpc04354', '123', 0)


INSERT INTO KHACHHANG VALUES
	(N'DarkTH', N'Trần Hũ Dark', '0123456789'),
	(N'DinhPQ', N'Phùng Quắk Dinh', '0123456789'),
	(N'DenNK', N'Nguyễn Khánk Đen', '0123456789'),
	(N'PeppaD', N'Đoàn Peppa', '0123456789'),
	(N'DeLB', N'Lê Bíck De', '0123456789')

INSERT INTO HOADON VALUES
	(N'HD01', N'DarkTH', N'VinhPQ', CAST('7-10-2022' AS DATE), 120000),
	(N'HD02', N'DenNK', N'VinhPQ', CAST('7-11-2022' AS DATE), 120000),
	(N'HD03', N'PeppaD', N'DanNK', CAST('7-11-2022' AS DATE), 120000),
	(N'HD04', N'DeLB', N'VinhPQ', CAST('7-11-2022' AS DATE), 120000),
	(N'HD05', N'DinhPQ', N'DanNK', CAST('7-11-2022' AS DATE), 120000)


INSERT INTO GIOHANG VALUES
	(N'HD01', N'SP01', 1),
	(N'HD02', N'SP02', 1),
	(N'HD03', N'SP01', 1),
	(N'HD04', N'SP04', 1),
	(N'HD05', N'SP01', 1)

-- DROP PROC sp_NHANVIENSX
CREATE PROC sp_NHANVIENSX
AS BEGIN
	SELECT 
		HD.TENDN,
		COUNT(HD.MAHD) SL
	FROM HOADON HD
		JOIN TAIKHOAN NV ON NV.TENDN = HD.TENDN
	WHERE NV.TENDN = HD.TENDN
	GROUP BY HD.TENDN
	ORDER BY SL DESC
END
GO

EXEC sp_NHANVIENSX

-- DROP PROC sp_ThongKeDoanhThu_NAM
CREATE PROC sp_ThongKeDoanhThu_NAM (@Year INT)
AS BEGIN
	SELECT
		COUNT(HD.MAHD) SLHD,
		SUM(HD.TONGTIEN) DoanhThu,
		MIN(HD.TONGTIEN) ThapNhat,
		MAX(HD.TONGTIEN) CaoNhat,
		AVG(HD.TONGTIEN) TrungBinh
	FROM HOADON HD
		WHERE YEAR(NGAYLAP) = @Year
END
GO

EXEC sp_ThongKeDoanhThu_NAM '2022'


-- DROP PROC sp_ThongKeDoanhThu_THANG
CREATE PROC sp_ThongKeDoanhThu_THANG (@Month INT)
AS BEGIN
	SELECT
		COUNT(HD.MAHD) SLHD,
		SUM(HD.TONGTIEN) DoanhThu,
		MIN(HD.TONGTIEN) ThapNhat,
		MAX(HD.TONGTIEN) CaoNhat,
		AVG(HD.TONGTIEN) TrungBinh
	FROM HOADON HD
		WHERE MONTH(NGAYLAP) = @Month
END
GO

EXEC sp_ThongKeDoanhThu_THANG '7'

-- DROP PROC sp_ThongKeDoanhThu_SP
CREATE PROC sp_ThongKeDoanhThu_SP
AS BEGIN
	SELECT

		GH.MASP,
		COUNT(HD.MAHD) SPBC

	FROM HOADON HD
	JOIN GIOHANG GH ON HD.MAHD = GH.MAHD
		WHERE HD.MAHD = GH.MAHD
		GROUP BY GH.MASP
		ORDER BY SPBC DESC
END
GO

EXEC sp_ThongKeDoanhThu_SP


/* SELECT * FROM SANPHAM
SELECT * FROM LOAIHANG
SELECT * FROM NHANVIEN
SELECT * FROM KHACHHANG
SELECT * FROM HOADON
SELECT * FROM GIOHANG */


