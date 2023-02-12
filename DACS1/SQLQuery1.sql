CREATE DATABASE DACS
GO

USE DACS
GO

CREATE TABLE THUONGHIEU
(
	MATH int NOT NULL,
	TENTH NVARCHAR(50) NOT NULL,
)
GO

ALTER TABLE THUONGHIEU ADD
CONSTRAINT PK_THUONGHIEU PRIMARY KEY(MATH)
GO

CREATE TABLE SANPHAM
(
	MASP int NOT NULL,
	TENSP NVARCHAR(max) NOT NULL,
	GIA NVARCHAR(MAX) not NULL,
	ANH NVARCHAR(MAX) NOT NULL,
	LOAISP NVARCHAR(20) NOT NULL,
	SALE NVARCHAR(MAX) NULL,
	SLKHO INT NULL,
	MATH NVARCHAR(20) NOT NULL

)
GO

ALTER TABLE SANPHAM ADD
CONSTRAINT PK_SANPHAM PRIMARY KEY(MASP),
CONSTRAINT FK_SANPHAM_THUONGHIEU FOREIGN KEY(MATH)
REFERENCES THUONGHIEU(MATH)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE TABLE GIOHANG
( 
	MASPGH NVARCHAR(20) NOT NULL,
	MASP NVARCHAR(20) NOT NULL,
)
GO

ALTER TABLE GIOHANG ADD
CONSTRAINT PK_GIOHANG PRIMARY KEY(MASPGH),
CONSTRAINT FK_GIOHANG_SANPHAM FOREIGN KEY(MASP)
REFERENCES SANPHAM(MASP)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE TABLE DATHANG
(
	MADH NVARCHAR(20) NOT NULL,
	TENKH VARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(MAX) NOT NULL,
	SDT NVARCHAR(10) NOT NULL,
	SOLUONG INT NULL,
	SIZE INT NULL,
	TRANGTHAI VARCHAR(20) NULL,
	MASPGH NVARCHAR(20) NOT NULL
)
GO

ALTER TABLE DATHANG ADD
CONSTRAINT PK_DATHANG PRIMARY KEY(MADH),
CONSTRAINT FK_DATHANG_GIOHANG FOREIGN KEY(MASPGH)
REFERENCES GIOHANG(MASPGH)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE TABLE LIENHE
(
	MALH int identity (1,1) NOT NULL,
	TENKH NVARCHAR(50) NOT NULL,
	EMAIL NVARCHAR(30) NOT NULL,
	SDT NVARCHAR(10) NOT NULL,
	GHICHU NVARCHAR(MAX) NULL
)
GO

ALTER TABLE LIENHE ADD
CONSTRAINT PK_LIENHE PRIMARY KEY (MALH)
GO

CREATE TABLE QUANTRI
(
	USERNAME VARCHAR(20) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL
)
GO

ALTER TABLE QUANTRI ADD
CONSTRAINT PK_QUANTRI PRIMARY KEY(USERNAME,PASSWORD)
GO