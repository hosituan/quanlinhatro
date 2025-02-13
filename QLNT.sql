USE QuanLyNhaTro
GO

if OBJECT_ID('viewtbPh_loaiPh_TT_join') is not null
	drop view viewtbPh_loaiPh_TT_join;
DROP TABLE IF EXISTS dbo.HoaDon
DROP TABLE IF EXISTS dbo.NguoiThue
DROP TABLE IF EXISTS dbo.Phong
DROP TABLE IF EXISTS dbo.TinhTrangHD
DROP TABLE IF EXISTS dbo.TinhTrangPhong
DROP TABLE IF EXISTS dbo.LoaiPhong
DROP TABLE IF EXISTS dbo.PhanQuyen
DROP TABLE IF EXISTS dbo.user1
GO

/******************************************************************CREATE TABLE******************************************************************************/
CREATE TABLE dbo.user1
(
	username nvarchar(50) NOT NULL,
	password nvarchar(50) NULL,
	HoTen nvarchar(50) NULL,
	idquyen int NOT NULL,
	CONSTRAINT PK_user1 PRIMARY KEY CLUSTERED 
(
	username ASC
)
) 
CREATE TABLE dbo.PhanQuyen(
	idquyen int,
	quyen nvarchar(50) NULL,
	 CONSTRAINT PK_PhanQuyen PRIMARY KEY CLUSTERED 
(
	idquyen ASC
)
)
GO
CREATE TABLE dbo.HoaDon(
	IDHoaDon int NOT NULL,
	TienDien float NULL,
	TienNuoc float NULL,
	TienWifi float NULL,
	NguoiThanhToan nvarchar(50) NULL,
	NgayThanhToan date NULL,
	TongTien float NULL,
	IDPhong int NULL,
	TinhTrang int NULL,
	NgayNhapHoaDon date NULL,
 CONSTRAINT PK_HoaD PRIMARY KEY CLUSTERED 
(
	IDHoaDon ASC
)
) 
GO
GO
CREATE TABLE dbo.LoaiPhong(
	IDLoai int NOT NULL,
	GiaPhong float NULL,
	TenLoai text NULL,
 CONSTRAINT PK_LoaiPhong PRIMARY KEY CLUSTERED 
(
	IDLoai ASC
) 
)  
GO
GO
CREATE TABLE dbo.NguoiThue(
	IDNguoi int NOT NULL,
	HoTen nvarchar(50) NULL,
	NgaySinh date NULL,
	NgheNghiep nvarchar(50) NULL,
	CMND int NULL,
	QueQuan nvarchar(50) NULL,
	SoDienThoaiLienLac int NULL,
	SoDienThoaiNguoiThan int NULL,
	GhiChu nvarchar(50) NULL,
	NgayThue date NULL,
	IDPhong int NULL,
 CONSTRAINT PK_NguoiThue PRIMARY KEY CLUSTERED 
(
	IDNguoi ASC
) 
) 
GO
GO
CREATE TABLE dbo.Phong(
	IDPhong int NOT NULL,
	SoLuongNguoi int NULL,
	TienNo float NULL,
	NguoiDaiDien nvarchar(100) NULL,
	GhiChu nvarchar(100) NULL,
	LoaiPhong int NULL,
	TinhTrang int NULL,
 CONSTRAINT PK_Phong PRIMARY KEY CLUSTERED 
(
	IDPhong ASC
) 
) 
GO
CREATE TABLE dbo.TinhTrangHD(
	IDTinhTrang int NOT NULL,
	TenTinhTrang nvarchar(50) NULL,
 CONSTRAINT PK_TinhTrangHD PRIMARY KEY CLUSTERED 
(
	IDTinhTrang ASC
) 
) 
GO
GO
CREATE TABLE dbo.TinhTrangPhong(
	IDTinhTrang int NOT NULL,
	TenTinhTrang nvarchar(50) NULL,
 CONSTRAINT PK_TinhTrangPhong PRIMARY KEY CLUSTERED 
(
	IDTinhTrang ASC
)
)
GO


--Tao Du Lieu
--Random Data Phong
declare @i int =1;
while @i <=70
begin
declare 
		@Songuoi int,
		@Loaiphong int,
		@Tinhtrang int

---tao so nguoi
DECLARE @temp9 INT
SELECT @temp9 = FLOOR(RAND()*(5-1+1))+1;
SELECT @Songuoi =  CAST(@temp9 AS VARCHAR(1))
---tao LoaiPhong
DECLARE @temp8 INT
SELECT @temp8 = FLOOR(RAND()*(3-1+1))+1;
SELECT @Loaiphong =  CAST(@temp8 AS VARCHAR(1))
---tao Tinh trang
Declare @temp7 int
select @temp7 = FLOOR(RAND()*(3-1+1))+1;
select @Tinhtrang = CAST(@temp7 AS VARCHAR(1))

	insert into Phong (IDPhong,SoLuongNguoi,TienNo,NguoiDaiDien,GhiChu,LoaiPhong,TinhTrang)
	values (@i, @Songuoi, 0, N'Tuấn','Không',@Loaiphong,@Tinhtrang)
	set @i = @i +1
end
--select * from phong;
-------

--Random Data NguoiThue

declare @j int =1;
while @j <=200
begin
declare @HoTen nvarchar(50),
		@CMND int,
		@Que nvarchar(50),
		@SoDienThoai int,
		@IDPhong int

---tao CMND
DECLARE @temp11 INT
SELECT @temp11 = FLOOR(RAND()*(999999999-100000000)+100000000)
SELECT @CMND =  CAST(@temp11 AS VARCHAR(10))
---tao SDT
DECLARE @temp12 INT
SELECT @temp12 = FLOOR(RAND()*(999999999-100000000)+100000000)
SELECT @SoDienThoai =  CAST(@temp12 AS VARCHAR(10))
---tao Idphong
DECLARE @temp13 INT
SELECT @temp13 = FLOOR(RAND()*(70-1+1))+1;
SELECT @IDPhong =  CAST(@temp13 AS VARCHAR(2))
---tao Que
SET @Que = (SELECT c1 AS [text()] FROM (SELECT TOP (1) c1 FROM (VALUES
      (N'An Giang'), (N'Bà Rịa - Vũng Tàu'), (N'Bạc Liêu'), (N'Bắc Cạn'), (N'Bắc Giang'), (N'Bắc Ninh'), (N'Bến Tre'), (N'Bình Dương'), (N'Bình Định'), (N'Bình Phước'),
      (N'Bình Thuận'), (N'Cà Mau'), (N'Cao Bằng'), (N'Cần Thơ'), (N'Đà Nẵng'), (N'Đắk Lắk'), (N'Đắk Nông'), (N'Đồng Nai'), (N'Đồng Tháp'), (N'Đồng Tháp'), (N'Điện Biên'),
	  (N'Gia Lai'), (N'Hà Giang'), (N'Hà Nam'), (N'Hà Nội'), (N'Hà Tĩnh'), (N'Hải Dương'), (N'Hải Phòng'), (N'Hòa Bình'), (N'Hậu Giang'), (N'Hưng Yên'), (N'Hồ Chí Minh'),
	  (N'Khánh Hòa'), (N'Kiên Giang'), (N'Kon Tum'), (N'Lai Châu'), (N'Lào Cai'), (N'Lạng Sơn'), (N'Lâm Đồng'), (N'Long An'), (N'Nam Định'), (N'Nghệ An'), (N'Ninh Bình'),
	  (N'Ninh Thuận'), (N'Phú Thọ'), (N'Phú Yên'), (N'Quảng Bình'), (N'Quảng Nam'), (N'Quảng Ngãi'), (N'Quảng Ninh'), (N'Quảng Trị'), (N'Sóc Trăng'), (N'Sơn La'), (N'Tây Ninh'),
	  (N'Thái Bình'), (N'Thái Nguyên'), (N'Thanh Hóa'), (N'Thừa Thiên Huế'), (N'Tiền Giang'), (N'Trà Vinh'), (N'Tuyên Quang'), (N'Vĩnh Long'), (N'Vĩnh Phúc'), (N'Yên Bái')
	  ) AS T1(c1)
	ORDER BY ABS(CHECKSUM(NEWID()))) AS T2 FOR XML PATH(''))
-----Tao Ten
--random họ
DECLARE @ho nvarchar(20)
SET @ho = (SELECT c1 AS [text()] FROM (SELECT TOP (1) c1 FROM (VALUES
      (N'Nguyễn'), (N'Trần'), (N'Lê'), (N'Phạm'), (N'Hoàng'), (N'Huỳnh'), (N'Phan'), (N'Vũ'), (N'Võ'), (N'Đặng'),
      (N'Bùi'), (N'Đỗ'), (N'Hồ'), (N'Ngô'), (N'Dương'), (N'Lý')
	  ) AS T1(c1)
	ORDER BY ABS(CHECKSUM(NEWID()))) AS T2 FOR XML PATH(''))
--random tên đệm
DECLARE @tenlot nvarchar(20)
SET @tenlot = (SELECT c1 AS [text()] FROM (SELECT TOP (1) c1 FROM (VALUES
      (N'Xuân'), (N'Thu'), (N'Cẩm'), (N'Văn'), (N'Thị'), (N'Châu'), (N'Hồng'), (N'Đức'), (N'Hạnh'), (N'Đình'),
      (N'Đại'), (N'Bá'), (N'Mạnh'), (N'Trọng'), (N'Gia'), (N'Kim'), (N'Duy')
	  ) AS T1(c1)
	ORDER BY ABS(CHECKSUM(NEWID()))) AS T2 FOR XML PATH(''))
--random tên
DECLARE @ten nvarchar(20)
SET @ten = (SELECT c1 AS [text()] FROM (SELECT TOP (1) c1 FROM (VALUES
      (N'Tuấn'), (N'Sơn'), (N'Hạnh'), (N'Thảo'), (N'Hiền'), (N'Dung'), (N'Anh'), (N'Bình'), (N'Nguyệt'), (N'Tuệ'),
      (N'Hiệp'), (N'Ly'), (N'Khánh'), (N'Long'), (N'Quốc'), (N'Loan'), (N'Hùng'), (N'Đạt'), (N'Diệu')
	  ) AS T1(c1)
	ORDER BY ABS(CHECKSUM(NEWID()))) AS T2 FOR XML PATH(''))
	set @HoTen = @ho + ' ' + @tenlot +' '+ @ten		


	insert into NguoiThue (IDNguoi,HoTen,NgaySinh,NgheNghiep,CMND,QueQuan,SoDienThoaiLienLac,SoDienThoaiNguoiThan,GhiChu,NgayThue,IDPhong)
	values (@j, @HoTen, '',N'Sinh Viên',@CMND, @Que,@SoDienThoai,@SoDienThoai,'Kh','',@IDPhong)
	set @j = @j +1
end


--Random data Hoa Don

declare @k int =1;
while @k <=200
begin
declare @Tiendien int,
		@Tiennuoc int,
		@tienwifi int,
		@IDPhong1 int,
		@TinhTrang1 int

-------------tao tien dien
DECLARE @temp21 INT
SELECT @temp21 = FLOOR(RAND()*(999999-100000)+100000)
SELECT @Tiendien =  CAST(@temp21 AS VARCHAR(7))
-------------tao tien nuoc
DECLARE @temp22 INT
SELECT @temp22 = FLOOR(RAND()*(999999-100000)+100000)
SELECT @Tiennuoc =  CAST(@temp22 AS VARCHAR(7))
--------------tao tien wifi
DECLARE @temp23 INT
SELECT @temp23 = FLOOR(RAND()*(999999-100000)+100000)
SELECT @Tienwifi =  CAST(@temp23 AS VARCHAR(7))
---------------tao ID Phong
DECLARE @temp24 INT
SELECT @temp24 = FLOOR(RAND()*(60-1)+1)
SELECT @IDPhong1 =  CAST(@temp24 AS VARCHAR(2))
---------------tao tinh trang
DECLARE @temp25 INT
SELECT @temp25 = FLOOR(RAND()*(3-1)+1)
SELECT @TinhTrang1 =  CAST(@temp25 AS VARCHAR(1))


	insert into HoaDon (IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang)
	values (@k, @Tiendien, @Tiennuoc,@tienwifi,N'Hồ Sĩ Tuấn', '', '',@IDPhong1,@TinhTrang1)
	set @k = @k +1
end


-- Tao Dữ liệu cho các table 

INSERT INTO dbo.PhanQuyen (idquyen,quyen) VALUES (1, N'Full')
INSERT INTO dbo.PhanQuyen (idquyen,quyen) VALUES (2, N'Read Only')
INSERT dbo.user1 (username,password, HoTen, idquyen) VALUES (N'admin',N'admin', N'Ho Si Tuan', 1)
INSERT dbo.user1 (username,password, HoTen, idquyen) VALUES (N'guest',N'guest', N'Ho Si Tuan', 2)
INSERT dbo.user1 (username,password, HoTen, idquyen) VALUES (N'tuan',N'1', N'Ho Si Tuan', 2)
INSERT dbo.LoaiPhong (IDLoai, GiaPhong, TenLoai) VALUES (1, 100000, N'Vip')
INSERT dbo.LoaiPhong (IDLoai, GiaPhong, TenLoai) VALUES (2, 200000, N'Super Vip')
INSERT dbo.LoaiPhong (IDLoai, GiaPhong, TenLoai) VALUES (3, 50000, N'Thuong')
INSERT dbo.TinhTrangHD (IDTinhTrang, TenTinhTrang) VALUES (1, N'Trả')
INSERT dbo.TinhTrangHD (IDTinhTrang, TenTinhTrang) VALUES (2, N'Chưa Trả')
INSERT dbo.TinhTrangPhong (IDTinhTrang, TenTinhTrang) VALUES (1, N'Đang Thuê')
INSERT dbo.TinhTrangPhong (IDTinhTrang, TenTinhTrang) VALUES (2, N'Còn Trống')
INSERT dbo.TinhTrangPhong (IDTinhTrang, TenTinhTrang) VALUES (3, N'Đang Sửa Chữa')
--INSERT dbo.HoaDon (IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang) VALUES (1, 10000, 20000, 30000, N'Nguyên', CAST(N'2016-03-02' AS Date), 60000, 1, 1)
--INSERT dbo.HoaDon (IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang) VALUES (2, 10000, 20000, 30000, N'Nam', CAST(N'2015-03-02' AS Date), 120000, 2, 2)
--INSERT dbo.HoaDon (IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang) VALUES (3, 20000, 60000, 30000, N'Tuấn', CAST(N'2016-03-02' AS Date), 220000, 1, 2)
--INSERT dbo.NguoiThue (IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong) VALUES (1, N'Thiên Quốc', CAST(N'1998-01-01' AS Date), N'Sinh Viên', 12345667, N'Đồng Nai', 949193222, 949193222, NULL, CAST(N'2015-01-01' AS Date), 1)
--INSERT dbo.NguoiThue (IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong) VALUES (2, N'Khôi Nguyên', CAST(N'1998-02-01' AS Date), N'Sinh Viên', 123456789, N'An Giang', 949193222, 949193222, NULL, CAST(N'2016-02-01' AS Date), 1)
--INSERT dbo.NguoiThue (IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong) VALUES (3, N'Thanh Nam', CAST(N'1998-02-01' AS Date), N'Sinh Viên', 123456789, N'TPHCM', 949193222, 949193222, NULL, CAST(N'2016-02-01' AS Date), 2)
--INSERT dbo.Phong (IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang) VALUES (1, 2, 100000, N'Nguyên', NULL, 1, 1)
--INSERT dbo.Phong (IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang) VALUES (2, 2, 0, N'Quốc', NULL, 2, 1)

ALTER TABLE dbo.HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_Phong1 FOREIGN KEY(IDPhong)
REFERENCES dbo.Phong (IDPhong)
GO
ALTER TABLE dbo.HoaDon CHECK CONSTRAINT FK_HoaDon_Phong1
GO
ALTER TABLE dbo.HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_TinhTrangHD FOREIGN KEY(TinhTrang)
REFERENCES dbo.TinhTrangHD (IDTinhTrang)
GO
ALTER TABLE dbo.HoaDon CHECK CONSTRAINT FK_HoaDon_TinhTrangHD
GO
ALTER TABLE dbo.NguoiThue  WITH CHECK ADD  CONSTRAINT FK_NguoiThue_Phong FOREIGN KEY(IDPhong)
REFERENCES dbo.Phong (IDPhong)
GO
ALTER TABLE dbo.NguoiThue CHECK CONSTRAINT FK_NguoiThue_Phong
GO
ALTER TABLE dbo.Phong  WITH CHECK ADD  CONSTRAINT FK_Phong_LoaiPhong FOREIGN KEY(LoaiPhong)
REFERENCES dbo.LoaiPhong (IDLoai)
GO
ALTER TABLE dbo.Phong CHECK CONSTRAINT FK_Phong_LoaiPhong
GO
ALTER TABLE dbo.Phong  WITH CHECK ADD  CONSTRAINT FK_Phong_TinhTrangPhong FOREIGN KEY(TinhTrang)
REFERENCES dbo.TinhTrangPhong (IDTinhTrang)
GO
ALTER TABLE dbo.Phong CHECK CONSTRAINT FK_Phong_TinhTrangPhong
GO
GO


/******************************************************************PROCEDURE STORE******************************************************************************/
/*******************************************************************************************************************************************************************/
---Table user1-------------


/****** Object:  StoredProcedure dbo.spTestLogin   ******/ --Dùng để kiểm tra đăng nhập, và quyền của user

IF OBJECT_ID('spTestLogin') is not null
drop proc spTestLogin;
go
CREATE proc dbo.spTestLogin
@username varchar(50), @password varchar(50)
AS
BEGIN
select *  from user1 join PhanQuyen on user1.idquyen=PhanQuyen.idquyen
where user1.username=@username and user1.password = @password
END
GO
/***
IF OBJECT_ID('spTestLogin') is not null
drop proc spTestLogin;

go
CREATE proc dbo.spTestLogin
@username varchar(50), @password varchar(50)
AS

BEGIN
declare @test as int
select @test = count(*) from user1
where user1.username=@username and user1.password = @password
return @test
END
GO

--test
declare @test int
exec @test=  spTestLogin @username = admin, @password = admin;
print  Convert(varchar, @test) ***/

--Neu co 1 hang thi se dang nhap duoc

go
/****** Object:  StoredProcedure dbo.spGetUser   ******/ --Dùng để lấy danh sách các User
if OBJECT_ID('spGetuser') is not null
drop proc spGetuser;
go
create proc dbo.spGetuser 
as 
begin 
select username, HoTen,user1.idquyen,PhanQuyen.quyen from user1 join PhanQuyen on user1.idquyen=PhanQuyen.idquyen
end
--exec spGetuser;
go

/******************************************************************LẤY DỮ LIỆU*******************************************************************************/

/****** Object:  StoredProcedure dbo.spGetPhong    ******/ --Dùng để lấy danh sách các phòng
GO

IF OBJECT_ID('spGetPhong') is not null
drop proc spGetPhong;
go 

CREATE PROCEDURE dbo.spGetPhong
	
AS
BEGIN
 select IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang, LoaiPhong.GiaPhong, LoaiPhong.TenLoai, TinhTrangPhong.TenTinhTrang
 from Phong join TinhTrangPhong on (Phong.TinhTrang = TinhTrangPhong.IDTinhTrang) join LoaiPhong on (Phong.LoaiPhong = LoaiPhong.IDLoai)
END
--exec spGetPhong;

go
/****** Object:  StoredProcedure dbo.spGetLoaiPhong     ******/ --Dùng để lấy danh sách các loại phòng
IF OBJECT_ID('spGetLoaiPhong') is not null
drop proc spGetLoaiPhong;
go 
CREATE PROCEDURE dbo.spGetLoaiPhong
	
AS
BEGIN
 select *
 from LoaiPhong 
END
--exec spGetLoaiPhong;
go
/****** Object:  StoredProcedure dbo.spGetTinhTrangPhong  ******/ --Dùng để lấy danh sách Tình trạng phòng

IF OBJECT_ID('spGetTinhTrangPhong') is not null
drop proc spGetTinhTrangPhong;
go 
CREATE PROCEDURE dbo.spGetTinhTrangPhong
	
AS
BEGIN
 select *
 from TinhTrangPhong
END
--exec spGetTinhTrangPhong;
go
/****** Object:  StoredProcedure dbo.spGetNguoiThue    ******/ --Dùng để lấy danh sách người thuê
IF OBJECT_ID('spGetNguoiThue') is not null
drop proc spGetNguoiThue;
go
CREATE PROCEDURE dbo.spGetNguoiThue
AS
BEGIN
 select *
 from NguoiThue 
END
--EXEC spGetNguoiThue;
go
/****** Object:  StoredProcedure dbo.spGetHoaDon   ******/ --Dùng để lấy danh sách hóa đơn

IF OBJECT_ID('spGetHoaDon') is not null
drop proc spGetHoaDon;
GO
CREATE PROCEDURE dbo.spGetHoaDon
AS
BEGIN
 select HoaDon.*, TinhTrangHD.TenTinhTrang
 from HoaDon join TinhTrangHD on (HoaDon.TinhTrang = TinhTrangHD.IDTinhTrang) join Phong on (HoaDon.IDPhong = Phong.IDPhong)
END

/******************************************************************INSERT DỮ LIỆU******************************************************************************/
go
/****** Object:  StoredProcedure dbo.spInsertPhong ******/ --Dùng để Insert 1 phòng vào table Phòng
IF OBJECT_ID('spInsertPhong') is not null
drop proc spInsertPhong;
go 
CREATE PROCEDURE dbo.spInsertPhong
@IDPhong int,
@SoLuongNguoi int = null,
@TienNo float = null,
@NguoiDaiDien nvarchar(100) = null,
@GhiChu nvarchar(100) = null,
@LoaiPhong int = null,
@TinhTrang int = null
AS
begin
 insert into Phong(IDPhong, SoLuongNguoi, TienNo,NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang) values ( @IDPhong, @SoLuongNguoi, @TienNo, @NguoiDaiDien, @GhiChu, @LoaiPhong, @TinhTrang)
END
--exec spInsertPhong @IDphong=5, @LoaiPhong=1;
--select * from Phong;
go

/****** Object:  StoredProcedure dbo.spInsertNguoiThue  ******/ --Dùng để Insert 1 Người thuê vào table Người Thuê

IF OBJECT_ID('spInsertNguoiThue') is not null
drop proc spInsertNguoiThue;
go 
CREATE PROCEDURE dbo.spInsertNguoiThue
@IDNguoi int,
@HoTen nvarchar(50),
@NgaySinh date,
@NgheNghiep nvarchar(50),
@CMND int,
@QueQuan nvarchar(50),
@SoDienThoaiLienLac int,
@SoDienThoaiNguoiThan int,
@GhiChu int,
@NgayThue date,
@IDPhong int
AS
begin
 insert into NguoiThue(IDNguoi, HoTen, NgaySinh,NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan,GhiChu, NgayThue, IDPhong) values (@IDNguoi, @HoTen, @NgaySinh,@NgheNghiep, @CMND, @QueQuan, @SoDienThoaiLienLac, @SoDienThoaiNguoiThan,@GhiChu, @NgayThue, @IDPhong)
END
GO

/****** Object:  StoredProcedure dbo.spInsertHoaDon  ******/  --Dùng để Insert 1 Hóa đơn vào table Hóa Đơn

IF OBJECT_ID('spInsertHoaDon') is not null
drop proc spInsertHoaDon;
go 
CREATE PROCEDURE dbo.spInsertHoaDon
@IDHoaDon int,
@IDPhong int,
@TienDIen float,
@TienNuoc float,
@TienWifi float,
@TongTien float,
@NguoiThanhToan nvarchar(50),
@NgayThanhToan date,
@TinhTrang int,
@NgayNhapHoaDon date
AS
begin
 insert into HoaDon(IDHoaDon, IDPhong, TienDien, TienNuoc, TienWifi, TongTien, NguoiThanhToan, NgayThanhToan, TinhTrang, NgayNhapHoaDon) values (@IDHoaDon, @IDPhong, @TienDien, @TienNuoc, @TienWifi, @TongTien, @NguoiThanhToan, @NgayThanhToan, @TinhTrang, @NgayNhapHoaDon)
END
GO
/****** Object:  StoredProcedure dbo.spInsertLoaiPhong  ******/  --Dùng để Insert 1 Loại phòng vào table loại phòng
IF OBJECT_ID('spInsertLoaiPhong') is not null
drop proc spInsertLoaiPhong;
go 
CREATE PROCEDURE dbo.spInsertLoaiPhong
@IDLoai int,
@GiaPhong int,
@TenLoai nvarchar(100)
AS
begin
 insert into LoaiPhong (IDLoai, GiaPhong, TenLoai) values (@IDLoai,@GiaPhong,@TenLoai)
END

/******************************************************************EDIT DỮ LIỆU******************************************************************************/
GO
/****** Object:  StoredProcedure dbo.spEditPhong ******/ --Dùng để Edit thông tin 1 phòng
IF OBJECT_ID('spEditPhong') is not null
drop proc spEditPhong;
go 
CREATE PROCEDURE dbo.spEditPhong
@IDPhong int,
@SoluongNguoi int,
@TienNo float,
@NguoiDaiDien nvarchar(100),
@GhiChu nvarchar(100),
@LoaiPhong int,
@TinhTrang int
AS
begin
 Update Phong  SET SoLuongNguoi=@SoLuongNguoi,Tienno= @TienNo, NguoiDaiDien= @NguoiDaiDien, GhiChu= @GhiChu, LoaiPhong= @LoaiPhong, TinhTrang= @TinhTrang
 where IDPhong = @IDPhong
END
GO

/****** Object:  StoredProcedure dbo.spEditNguoiThue ******/ --Dùng để Edit thông tin người thuê
IF OBJECT_ID('spEditNguoiThue') is not null
drop proc spEditNguoiThue;
go 
CREATE PROCEDURE dbo.spEditNguoiThue
@IDNguoi int,
@HoTen nvarchar(50),
@NgaySinh date,
@NgheNghiep nvarchar(50),
@CMND int,
@QueQuan nvarchar(50),
@SoDienThoaiLienLac int,
@SoDienThoaiNguoiThan int,
@GhiChu nvarchar(50),
@NgayThue date,
@IDPhong int
AS
begin
 Update NguoiThue  SET HoTen= @HoTen, NgaySinh= @NgaySinh, NgheNghiep=@NgheNghiep, CMND = @CMND, QueQuan = @QueQuan, sodienthoailienlac= @SoDienThoaiLienLac, sodienthoainguoithan = @SoDienThoaiNguoiThan, ghichu=@ghichu, ngaythue = @NgayThue, IDPhong = @idPhong
 where IDNguoi= @IDNguoi;
END
GO

/****** Object:  StoredProcedure dbo.spEditHoaDon ******/ --Dùng để Edit thông tin Hóa Đơn
IF OBJECT_ID('spEditHoaDon') is not null
drop proc spEditHoaDon;
go 
CREATE PROCEDURE dbo.spEditHoaDon
@IDHoaDon int,
@IDPhong int,
@TienDIen float,
@TienNuoc float,
@TienWifi float,
@TongTien float,
@NguoiThanhToan nvarchar(50),
@NgayThanhToan date,
@TinhTrang int
AS
begin
 Update HoaDon  SET IDPhong=@IDPhong, TienDien=@TienDien, TienNuoc = @TienNuoc, TienWifi = @TienWifi, TongTien=@TongTien, NguoiThanhToan=@NguoiThanhToan, NgayThanhToan=@NgayThanhToan, TinhTrang=@TinhTrang
 where IDHoaDon=@IDHoaDon
END
GO

/****** Object:  StoredProcedure dbo.spEdituser ******/ --Dùng để Edit quyền của user. Chỉ được thực hiện bởi người có quyền 1 (Full)
IF OBJECT_ID('spEditUser') is not null
drop proc spEditUser;
go 
CREATE PROCEDURE dbo.spEdituser
@username nvarchar(100),
@IDquyen int
AS
begin
 Update user1  SET IDquyen=@IDquyen
 where username = @username
END
GO

/****** Object:  StoredProcedure dbo.spEditLoaiPhong ******/ --Dùng để Edit thông tin Loại Phòng
IF OBJECT_ID('spEditLoaiPhong') is not null
drop proc spEditLoaiPhong;
go 
CREATE PROCEDURE dbo.spEditLoaiPhong
@IDLoai int,
@Gia int,
@TenLoai nvarchar(100)
AS
begin
 Update LoaiPhong  SET IDLoai=@IDLoai, GiaPhong=@Gia, TenLoai=@TenLoai
 where IDLoai = @IDLoai
END
GO


/******************************************************************DELETE DỮ LIỆU******************************************************************************/
go
/****** Object:  StoredProcedure dbo.spDeleteLoaiPhong     ******/ --Dùng để Delete 1 hàng của table Loại phòng
GO
IF OBJECT_ID('spDeleteLoaiPhong') is not null
drop proc spDeleteloaiPhong;
go 
CREATE PROCEDURE dbo.spDeleteLoaiPhong
@IDLoai int
AS
begin
	delete from LoaiPhong where LoaiPhong.IDLoai = @IDLoai
END 
GO

/****** Object:  StoredProcedure dbo.spDeletePhong     ******/ --Dùng để Delete 1 hàng của table Phòng
GO
IF OBJECT_ID('spDeletePhong') is not null
drop proc spDeletePhong;
go 
CREATE PROCEDURE dbo.spDeletePhong
@IDPhong int
AS
begin try
begin tran;	
	delete from HoaDon where HoaDon.IDPhong = @IDPhong;
	delete from NguoiThue where IDPhong=@IDPhong;
	delete from Phong where Phong.IDPhong = @IDPhong;
	commit tran;

END try
begin catch
	rollback tran;
end catch
GO
/****** Object:  StoredProcedure dbo.spDeleteNguoiThue    ******/ --Dùng để Delete 1 hàng của table Người thuê
GO
IF OBJECT_ID('spDeleteNguoiThue') is not null
drop proc spDeleteNguoiThue;
go 
CREATE PROCEDURE dbo.spDeleteNguoiThue
@IDNguoi int
AS
begin
 delete from NguoiThue where NguoiThue.IDNguoi = @IDNguoi
END
GO
/****** Object:  StoredProcedure dbo.spDeleteHoaDon    ******/ --Dùng để Delete 1 hàng của table Hóa Đơn
GO
IF OBJECT_ID('spDeleteHoaDon') is not null
drop proc spDeleteHoaDon;
go 
CREATE PROCEDURE dbo.spDeleteHoaDon
@IDHoaDon int
AS
begin
 delete from HoaDon where HoaDon.IDHoaDon = @IDHoaDon
END

GO

/****** Object:  StoredProcedure dbo.spDeleteHoaDon    ******/ --Dùng để tính cột Tổng tiền của table hóa đơn. Bằng tổng 3 cột Tiền Điện, tiền nước, tiền wifi

if object_id('SumTien') is not null
drop proc SumTien;
go
CREATE proc dbo.SumTien
as
begin 
DROP TABLE IF EXISTS dbo.TongTien
CREATE TABLE TongTien(idbill int not null,tongtien int not null);
insert into TongTien(idbill, tongtien) 
SELECT HoaDon.IDHoaDon, HoaDon.TienDien+HoaDon.TienNuoc+HoaDon.TienWifi
FROM HoaDon
update HoaDon set HoaDon.TongTien = TongTien.tongtien
from HoaDon inner join TongTien on HoaDon.IDHoaDon = TongTien.idbill
end;
go
/******************************************************************FUNCTION******************************************************************************/
go

/****** Object:  Function fnSumChuaThanhToan    ******/ --Dùng để tính tổng số tiền CHƯA thanh toán của table Hóa Đơn (TinhTrang=2)
GO
if object_id('fnSumChuaThanhToan') is not null
drop function fnSumChuaThanhToan;
GO
CREATE FUNCTION fnSumChuaThanhToan()
returns int
begin 
return (select sum(HoaDon.TongTien)
		from HoaDon
		where HoaDon.TinhTrang=2 );
end;

--print convert(varchar,fnSumChuaThanhToan)
GO
--Proc dùng để dưa dữ liệu chưa thanh toán lên form bằng C#
IF OBJECT_ID('spGetTT') is not null
drop proc spGetTT;

go
CREATE proc dbo.spGetTT
@chuatt as int out
AS
BEGIN
declare @datt int
set @chuatt = dbo.fnSumChuaThanhToan()
set @datt =  dbo.fnSumDaThanhToan()
return @datt
END
GO
--declare @test as int
--exec @test =spGetTT @chuatt=1;
--print convert(varchar,@test)
--print convert(varchar,dbo.fnSumChuaThanhToan());

GO
/****** Object:  Function fnSumDaThanhToan    ******/ --Dùng để tính tổng số tiền ĐÃ thanh toán của table Hóa Đơn (TinhTrang=1)
GO
if object_id('fnSumDaThanhToan') is not null
drop function fnSumDaThanhToan;
GO
CREATE FUNCTION fnSumDaThanhToan()
returns float
begin 
return (select  sum(HoaDon.TongTien)
		from HoaDon
		where HoaDon.TinhTrang=1)

end;
GO
--Proc dùng để đưa dữ liệu lên Form bằng c#
IF OBJECT_ID('spGetDaTT') is not null
drop proc spGetDaTT;

go
CREATE proc dbo.spGetDaTT
@value as int = null
AS
BEGIN
select @value = dbo.fnSumDaThanhToan();
return @value
END
GO
--print convert(varchar,dbo.fnSumDaThanhToan());
GO

/******************************************************************DYNAMIC SEARCH******************************************************************************/
go
------Tìm người thuê
--------------------
go
if  object_id(N'dbo.SearchNguoiThue') is not null drop proc dbo.SearchNguoiThue;
go
create proc dbo.SearchNguoiThue
	@IDNguoi as int = null,
	@HoTen as nvarchar(50) = null,
	@DiaChi as nvarchar(50) = null,
	@CMND as int = null,
	@SoDienThoaiLienLac as int =null	
as
declare @sql as nvarchar(1000);
set @sql =
	N'select * from NguoiThue '
	+ N'where 1=1 '
	+ CASE WHEN @IDNguoi is not null then
		N' AND IDNguoi = '+convert(nvarchar,@IDNguoi)  ELSE +N' ' END 
	 +CASE when @HoTen is not null then
	N' AND HoTen like N'''+'%'+ @HoTen +'%'+ N'''' ELSE N' ' END 
		+CASE when @DiaChi is not null then
	N' AND QueQuan like N'''+'%'+ @DiaChi +'%'+ N'''' ELSE N' ' END 
		+CASE when @CMND is not null then
	N' AND CMND='+convert(nvarchar,@CMND) ELSE  +N' ' END 
		+CASE when @SoDienThoaiLienLac is not null then
	N' AND SoDienThoaiLienLac='+convert(nvarchar,@SoDienThoaiLienLac) ELSE +N' ' END;
	print @sql;
exec sp_executesql
	@stml = @sql,
	@params = N'@ID as int, @Ten as nvarchar(50), @Dchi as nvarchar(50), @CM as int, @SDT as int',
	@ID = @IDNguoi,
	@Ten = @HoTen,
	@DChi = @DiaChi,
	@CM= @CMND,
	@SDT = @SoDienThoaiLienLac;
go
--exec dbo.SearchNguoiThue   @DiaChi='Tp';
---Tim Hoa Don
go

------Tìm Hóa Đơn
--------------------
if object_id(N'dbo.SearchBill') is not null drop proc dbo.SearchBill;
go
create proc dbo.SearchBill
	@IDHoaDon as int = null,
	@IDPhong as int = null,
	@TinhTrang as int = null
as
declare @sql as nvarchar(1000);
set @sql =
	N'select * from HoaDon '
	+ N'where 1=1 '
	+ CASE WHEN @IDHoaDon is not null then
		N' AND IDHoaDon = '+convert(nvarchar,@IDHoaDon)  ELSE +N' ' END
			+ CASE WHEN @IDPhong is not null then
		N' AND IDPhong = '+convert(nvarchar,@IDPhong)  ELSE +N' ' END 
			+ CASE WHEN @TinhTrang is not null then
		N' AND TinhTrang = '+convert(nvarchar,@TinhTrang)  ELSE +N' ' END;
exec sp_executesql
	@stml = @sql,
	@params = N'@IDHD as int, @IDPh as int, @TT as int',
	@IDHD = @IDHoaDon,
	@IDPh = @IDPhong,
	@TT = @TinhTrang
go
--exec dbo.SearchBill @IDPhong=1 ;
---Tim Phong
go
------Tìm Phòng
--------------------
if object_id(N'dbo.SearchPhong') is not null drop proc dbo.SearchPhong;
go
create proc dbo.SearchPhong
	@IDPhong as int = null,
	@NguoiDaiDien as nvarchar(100) = null,
	@LoaiPhong as int = null
as
declare @sql as nvarchar(1000);
set @sql =
	N'select IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong,  TinhTrang,LoaiPhong.GiaPhong, LoaiPhong.TenLoai, TinhTrangPhong.TenTinhTrang
 from Phong join TinhTrangPhong on (Phong.TinhTrang = TinhTrangPhong.IDTinhTrang) join LoaiPhong on (Phong.LoaiPhong = LoaiPhong.IDLoai) '
	+ N'where 1=1 '
	+ CASE WHEN @IDPhong is not null then
		N' AND Phong.IDPhong = '+convert(nvarchar,@IDPhong)  ELSE +N' ' END
			+ CASE WHEN @NguoiDaiDien is not null then
		N' AND Phong.NguoiDaiDien like N'''+'%'+ @NguoiDaiDien +'%'+ N'''' ELSE N' ' END 
			+ CASE WHEN @LoaiPhong is not null then
		N' AND Phong.LoaiPhong = '+convert(nvarchar,@LoaiPhong)  ELSE +N' ' END;
exec sp_executesql
	@stml = @sql,
	@params = N'@IDPh as int, @NDD as nvarchar(100), @LP as int',
	@IDph=@IDPhong,
	@NDD=@NguoiDaiDien,
	@LP = @LoaiPhong
go
--test
--exec dbo.SearchPhong @IDPhong=1 ;
go

------Tìm User
--------------------
go
if  object_id(N'dbo.SearchUser') is not null drop proc dbo.SearchUser;
go
create proc dbo.SearchUser
	@username as nvarchar(100) = null,
	@HoTen as nvarchar(50) = null
as
declare @sql as nvarchar(1000);
set @sql =
	N'select * ,  from user1 '
	+ N'where  username like N'''+'%'+ @username +'%'+ N'''' + N' or HoTen like N'''+'%'+@HoTen +'%'+N'''';	
exec sp_executesql
	@stml = @sql,
	@params = N'@user as nvarchar(50), @Ten as nvarchar(50)',
	@user =@username,
	@Ten = @HoTen

--exec dbo.SearchUser   @username='ad', @HoTen='x';
go
/******************************************************************TRIGGER******************************************************************************/
/******************************************************************************************************************************************************/
go


---Trigger Instead of
---Tạo các Table Archive 
DROP TABLE IF EXISTS dbo.HoaDonArchive
DROP TABLE IF EXISTS dbo.NguoiThueArchive
DROP TABLE IF EXISTS dbo.PhongArchive
DROP TABLE IF EXISTS dbo.TinhTrangHDArchive
DROP TABLE IF EXISTS dbo.TinhTrangPhongArchive
DROP TABLE IF EXISTS dbo.LoaiPhongArchive
CREATE TABLE dbo.HoaDonArchive(
	IDHoaDon int NOT NULL,
	TienDien float NULL,
	TienNuoc float NULL,
	TienWifi float NULL,
	NguoiThanhToan nvarchar(50) NULL,
	NgayThanhToan date NULL,
	TongTien float NULL,
	IDPhong int NULL,
	TinhTrang int NULL,
	NgayNhapHoaDon date NULL,
	)
GO
GO
CREATE TABLE dbo.LoaiPhongArchive(
	IDLoai int NOT NULL,
	GiaPhong float NULL,
	TenLoai text NULL,
)
GO
GO
CREATE TABLE dbo.NguoiThueArchive(
	IDNguoi int NOT NULL,
	HoTen nvarchar(50) NULL,
	NgaySinh date NULL,
	NgheNghiep nvarchar(50) NULL,
	CMND int NULL,
	QueQuan nvarchar(50) NULL,
	SoDienThoaiLienLac int NULL,
	SoDienThoaiNguoiThan int NULL,
	GhiChu nvarchar(50) NULL,
	NgayThue date NULL,
	IDPhong int NULL
	)
GO
GO
CREATE TABLE dbo.PhongArchive(
	IDPhong int NOT NULL,
	SoLuongNguoi int NULL,
	TienNo float NULL,
	NguoiDaiDien nvarchar(100) NULL,
	GhiChu nvarchar(100) NULL,
	LoaiPhong int NULL,
	TinhTrang int NULL,
) 
GO
GO
CREATE TABLE dbo.TinhTrangHDArchive(
	IDTinhTrang int NOT NULL,
	TenTinhTrang nvarchar(50) NULL,
) 
GO
GO
CREATE TABLE dbo.TinhTrangPhongArchive(
	IDTinhTrang int NOT NULL,
	TenTinhTrang nvarchar(50) NULL,
)


/******/
---ARCHIVE DELETE
---Delete Nguoi Thue
go

--------------------------------------------------------ARCHIVE DELETE
/*** Archive Delete NguoiThue  ***/
if OBJECT_ID('NguoiThueDelete') is not null
	drop trigger NguoiThueDelete;
go
create trigger NguoiThueDelete
on NguoiThue
after Delete
as
insert into NguoiThueArchive
(IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong)
select *
from Deleted;

--test
--delete NguoiThue where IDNguoi=2;
--select * from NguoiThue;
--select * from NguoiThueArchive;
---Delete HoaDon
go
go
--Dùng Proc này để Return lại bước đã Delete Người Thuê
if object_id('spDelNguoiThueReturn') is not null
drop proc spDelNguoiThueReturn;
go
create proc spDelNguoiThueReturn
as
begin
INSERT INTO NguoiThue (IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong)
SELECT *
FROM NguoiThueArchive
WHERE IDNguoi =NguoiThueArchive.IDNguoi;
delete from NguoiThueArchive;
end
--exec spDelNguoiThueReturn
--select * from NguoiThueArchive;
go
/*** Archive Delete Hoa Don  ***/
if OBJECT_ID('HoaDonDelete') is not null
	drop trigger HoaDonDelete;
go
create trigger HoaDonDelete
on HoaDon
after Delete
as
begin
delete from HoaDonArchive;
insert into HoaDonArchive
(IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang, NgayNhapHoaDon)
select *
from Deleted;
end

--test
--delete HoaDon where IDHoaDon=2;
--select * from HoaDon;
--select * from HoaDonArchive;
---Delete Phong
go
--Dùng Proc này để Return lại bước đã Delete Hóa Đơn
if object_id('spDelHoaDonReturn') is not null
drop proc spDelHoaDonReturn;
go
create proc spDelHoaDonReturn
as
begin
INSERT INTO HoaDon (IDHoaDon,TienDien, TienNuoc,TienWifi,NguoiThanhToan,NgayThanhToan,TongTien,IDPhong,TinhTrang,NgayNhapHoaDon)
SELECT *
FROM HoaDonArchive
WHERE IDHoaDon =HoaDonArchive.IDHoaDon;
delete from HoaDonArchive;
end
GO

/*** Archive Delete Phong  ***/
if OBJECT_ID('PhongDelete') is not null
	drop trigger PhongDelete;
go
create trigger PhongDelete
on Phong
after Delete
as
delete from PhongArchive;
insert into PhongArchive
(IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong,TinhTrang)
select *
from Deleted;
--test
--delete Phong where IDPhong=10;
--select * from Phong;
--select * from PhongArchive;
go
--Dùng Proc này để Return lại bước đã Delete Phòng
if object_id('spDelPhongReturn') is not null
drop proc spDelPhongReturn;
go
create proc spDelPhongReturn
as
begin
INSERT INTO Phong (IDPhong,SoLuongNguoi,TienNo,NguoiDaiDien,GhiChu,LoaiPhong,TinhTrang)
SELECT *
FROM PhongArchive
WHERE IDPhong =PhongArchive.IDPhong;
delete from PhongArchive;
end
GO

go
/******/
--------------------------------------------------------ARCHIVE UPDATE
go
/*** Archive UPDATE NguoiThue  ***/
if OBJECT_ID('NguoiThueEdit') is not null
	drop trigger NguoiThueEdit;
go
create trigger NguoiThueEdit
on NguoiThue
after update
as
begin
	delete from NguoiThueArchive;
	insert into NguoiThueArchive
	(IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong)
	select * 
	from deleted;
end
--test
--update NguoiThue set Hoten=N'Ho Si Tuan' where IDNguoi=2;
--select * from NguoiThue;
--select * from NguoiThueArchive;

if OBJECT_ID('spEditNguoiThueReturn') is not null
drop proc spEditNguoiThueReturn;
go
create proc spEditNguoiThueReturn
as
begin
 Update NguoiThue SET HoTen=NguoiThueArchive.HoTen, NgaySinh=NguoiThueArchive.NgaySinh, NgheNghiep=NguoiThueArchive.NgheNghiep,CMND=NguoiThueArchive.CMND,QueQuan=NguoiThueArchive.QueQuan,SoDienThoaiLienLac=NguoiThueArchive.SoDienThoaiLienLac,SoDienThoaiNguoiThan=NguoiThueArchive.SoDienThoaiNguoiThan,GhiChu=NguoiThueArchive.GhiChu,NgayThue=NguoiThueArchive.NgayThue,IDPhong=NguoiThueArchive.IDPhong
 from NguoiThue Right join dbo.NguoiThueArchive on NguoiThue.IDNguoi=NguoiThueArchive.IDNguoi
end
go

exec spEditNguoiThueReturn;
go
go
/*** Archive UPDATE PHONG  ***/
if OBJECT_ID('PhongEdit') is not null
	drop trigger PhongEdit;
go
create trigger PhongEdit
on Phong
after update
as
begin
	delete from PhongArchive;
	insert into PhongArchive
	(IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang)
	select * 
	from deleted;
end

go

if OBJECT_ID('spEditPhongReturn') is not null
drop proc spEditPhongReturn;
go
create proc spEditPhongReturn
as
begin
 Update Phong SET SoLuongNguoi=PhongArchive.SoLuongNguoi,Tienno= PhongArchive.TienNo, NguoiDaiDien= PhongArchive.NguoiDaiDien, GhiChu= PhongArchive.GhiChu, LoaiPhong= PhongArchive.LoaiPhong, TinhTrang= PhongArchive.TinhTrang
 from Phong Right join dbo.PhongArchive on Phong.IDPhong=PhongArchive.IDPhong
end
go

go
--test
--update phong set NguoiDaiDien=N'Si Tuan' where IDPhong=1;
--delete from PhongArchive;
--select * from phong;
--select * from PhongArchive;
--exec spEditPhongReturn;
go
/*** Archive UPDATE Hoa Don  ***/
if OBJECT_ID('HoaDonEdit') is not null
	drop trigger HoaDonEdit;
go
create trigger HoaDonEdit
on HoaDon
for update
as
	delete from HoaDonArchive;
	insert into HoaDonArchive
	(IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang, NgayNhapHoaDon)
	select * 
	from deleted;
go

--update HoaDon set NguoiThanhToan = N'Si Tuan2' where IDHoaDon=1;
--select * from hoadon;
--select * from HoaDonArchive;
go
if OBJECT_ID('spEditHoaDonReturn') is not null
drop proc spEditHoaDonReturn;
go
create proc spEditHoaDonReturn
as
begin
 Update Phong SET SoLuongNguoi=PhongArchive.SoLuongNguoi,Tienno= PhongArchive.TienNo, NguoiDaiDien= PhongArchive.NguoiDaiDien, GhiChu= PhongArchive.GhiChu, LoaiPhong= PhongArchive.LoaiPhong, TinhTrang= PhongArchive.TinhTrang
 from Phong Right join dbo.PhongArchive on Phong.IDPhong=PhongArchive.IDPhong
end
go

/******/
---ARCHIVE INSERT

/****** Insert Phong **/

if OBJECT_ID('PhongInsert') is not null
	drop trigger PhongInsert;
go
create trigger PhongInsert
on Phong
for insert
as
	delete from PhongArchive;
	insert into PhongArchive
	(IDPhong, SoLuongNguoi, TienNo, NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang)
	select * 
	from inserted;
go

go
if OBJECT_ID('spInsertPhongReturn') is not null
drop proc spInsertPhongReturn;
go
create proc spInsertPhongReturn
as
begin
 delete from Phong 
 where Phong.IDPhong= (select IDPhong from PhongArchive)
end
go

/****** Insert Nguoi Thue **/

if OBJECT_ID('NguoiInsert') is not null
	drop trigger NguoiInsert;
go
create trigger NguoiInsert
on NguoiThue
for insert
as
	delete from NguoiThueArchive;
	insert into NguoiThueArchive
	(IDNguoi, HoTen, NgaySinh, NgheNghiep, CMND, QueQuan, SoDienThoaiLienLac, SoDienThoaiNguoiThan, GhiChu, NgayThue, IDPhong)
	select * 
	from inserted;
go

go
if OBJECT_ID('spInsertNguoiReturn') is not null
drop proc spInsertNguoiReturn;
go
create proc spInsertNguoiReturn
as
begin
 delete from NguoiThue 
 where NguoiThue.IDNguoi= (select IDNguoi from NguoiThueArchive)
end
go

/****** Insert Hóa Đơn **/

if OBJECT_ID('HoaDonInsert') is not null
	drop trigger HoaDonInsert;
go
create trigger HoaDonInsert
on HoaDon
for insert
as
	delete from HoaDonArchive;
	insert into HoaDonArchive
	(IDHoaDon, TienDien, TienNuoc, TienWifi, NguoiThanhToan, NgayThanhToan, TongTien, IDPhong, TinhTrang, NgayNhapHoaDon)
	select * 
	from inserted;
go

go
if OBJECT_ID('spInsertHoaDonReturn') is not null
drop proc spInsertHoaDonReturn;
go
create proc spInsertHoaDonReturn
as
begin
 delete from HoaDon
 where HoaDon.IDHoaDon= (select IDHoaDon from HoaDonArchive)
end
go


/******/


/******************************************************************INDEX******************************************************************************/
/******************************************************************************************************************************************************/

--set statistics io, time off;

--Index cho Tìm kiếm ở table Phòng bằng NguoiDaiDien và LoaiPhong
drop index if exists index_Phong_NguoiDaiDien_LoaiPhong on Phong;
create nonclustered index index_Phong_NguoiDaiDien_LoaiPhong on dbo.Phong(IDPhong, SoLuongNguoi, TienNo,NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang); 
select IDPhong from phong where NguoiDaiDien=N'Tuấn' and LoaiPhong=1;

--Index cho Tìm kiếm ở table Hóa Đơn bằng Phòng, Tình Trạng
drop index if exists index_HoaDon_ID_TinhTrang on HoaDon;
create nonclustered index index_HoaDon_ID_TinhTrang on dbo.HoaDon(IDPhong, TinhTrang); 
--select IDHoaDon from HoaDon where IDPhong=9 and TinhTrang=1;


--Index cho Tìm kiếm ở table Người Thuê 
drop index if exists index_NguoiThue on NguoiThue;
create nonclustered index index_NguoiThue on dbo.NguoiThue(HoTen, QueQuan, CMND, SoDienThoaiLienLac); 
--select IDNguoi from NguoiThue where HoTen=N'H';

--Index cho Tìm kiếm ở table Phòng join Loai Phong join Tinh Trang
go
if OBJECT_ID('viewtbPh_loaiPh_TT_join') is not null
	drop view viewtbPh_loaiPh_TT_join;
go
CREATE VIEW viewtbPh_loaiPh_TT_join with schemabinding
as 
select IDPhong,SoLuongNguoi, TienNo,NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang
from dbo.Phong inner join dbo.LoaiPhong on Phong.LoaiPhong=LoaiPhong.IDLoai inner join dbo.TinhTrangPhong on Phong.TinhTrang=TinhTrangPhong.IDTinhTrang
go

drop index if exists index_Ph_loaiPh_TT_join on viewtbPh_loaiPh_TT_join;
create unique clustered index index_Ph_loaiPh_TT_join on viewtbPh_loaiPh_TT_join (SoLuongNguoi, TienNo,NguoiDaiDien, GhiChu, LoaiPhong, TinhTrang);
--select IDPhong
--from Phong inner join LoaiPhong on Phong.LoaiPhong=LoaiPhong.IDLoai inner join TinhTrangPhong on Phong.TinhTrang=TinhTrangPhong.IDTinhTrang
--where TinhTrang=1;






