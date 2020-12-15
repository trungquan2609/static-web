CREATE DATABASE DB_DATN;
GO

USE DB_DATN
GO

CREATE TABLE tbl_khoahoc
( MaKH TINYINT PRIMARY KEY,
  TenKhoa NVARCHAR(10),
  ThoiGian NVARCHAR(50),
  GhiChu NVARCHAR(50)
  )
  GO
  
CREATE TABLE tbl_chuyennganh
( MaCN TINYINT PRIMARY KEY,
  TenCN NVARCHAR(50),
  GhiChu NVARCHAR(50)
  )
  GO
  
CREATE TABLE tbl_sinhvien
( MaSV CHAR(10) PRIMARY KEY,
  TenSV NVARCHAR(50),
  NamSinh DATE,
  GioiTinh BIT CONSTRAINT CK_SEXX CHECK (GioiTinh=0 OR GioiTinh=1),
  Khoa TINYINT CONSTRAINT FK_Khoa FOREIGN KEY(Khoa) REFERENCES dbo.tbl_khoahoc(MaKH),
  ChuyenNganh TINYINT CONSTRAINT FK_CN FOREIGN KEY(ChuyenNganh) REFERENCES dbo.tbl_chuyennganh(MaCN),
  Email VARCHAR(50),
  DienThoai VARCHAR(50),
  DiaChi NVARCHAR(150),
  GhiChu NVARCHAR(200)
  )
  GO
  
CREATE TABLE tbl_giangvien
( MaGV CHAR(6) PRIMARY KEY,
  TenGV NVARCHAR(50),
  NamSinh DATE,
  GioiTinh BIT CONSTRAINT CK_SEX CHECK (GioiTinh=0 OR GioiTinh=1),
  HocVi NVARCHAR(50) CONSTRAINT CK_HocVi CHECK (HocVi='Kỹ sư' OR HocVi='Thạc sĩ' OR HocVi='Tiến sĩ'),
  Email VARCHAR(50),
  DienThoai VARCHAR(50),
  DiaChi NVARCHAR(150)
  ) 
  GO

--Sửa constraint HocVi
ALTER TABLE dbo.tbl_giangvien DROP CONSTRAINT CK_HocVi;
ALTER TABLE dbo.tbl_giangvien ADD CONSTRAINT CK_HV CHECK (HocVi=N'Kỹ sư' OR HocVi=N'Thạc sĩ' OR HocVi=N'Tiến sĩ');


CREATE TABLE tbl_linhvuc
( MaLV TINYINT PRIMARY KEY,
  TenLV NVARCHAR(150),
  GhiChu NVARCHAR(150)
  )
  GO
  
CREATE TABLE tbl_doan
( MaSV CHAR(10) PRIMARY KEY,
  TenDA NVARCHAR(400),
  GVHD CHAR(6) CONSTRAINT FK_HD FOREIGN KEY (GVHD) REFERENCES dbo.tbl_giangvien(MaGV),
  GVPB CHAR(6) CONSTRAINT FK_PB FOREIGN KEY (GVPB) REFERENCES dbo.tbl_giangvien(MaGV),
  LinhVuc TINYINT CONSTRAINT FK_LV FOREIGN KEY (LinhVuc) REFERENCES dbo.tbl_linhvuc(MaLV),
  Diem DECIMAL(3,1),
  NamTN SMALLINT
  )
  GO

--Thêm dữ liệu vào các bảng tbl_khoahoc
INSERT INTO tbl_khoahoc VALUES (47, N'Khóa 47 ',N'2002-2007 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (48, N'Khóa 48 ',N'2003-2008 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (49, N'Khóa 49 ',N'2004-2009 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (50, N'Khóa 50 ',N'2005-2010 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (51, N'Khóa 51 ',N'2006-2011 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (52, N'Khóa 52 ',N'2007-2012 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (53, N'Khóa 53 ',N'2008-2013 ',N'Đào tạo niên chế')
INSERT INTO tbl_khoahoc VALUES (54, N'Khóa 54 ',N'2009-2014 ',N'Đào tạo tín chỉ')
INSERT INTO tbl_khoahoc VALUES (55, N'Khóa 55 ',N'2010-2015 ',N'Đào tạo tín chỉ')
INSERT INTO tbl_khoahoc VALUES (56, N'Khóa 56 ',N'2011-2016 ',N'Đào tạo tín chỉ')
INSERT INTO tbl_khoahoc VALUES (57, N'Khóa 57 ',N'2012-2017 ',N'Đào tạo tín chỉ')
INSERT INTO tbl_khoahoc VALUES (58, N'Khóa 58 ',N'2013-2018 ',N'Đào tạo tín chỉ')
GO

--Thêm dữ liệu vào bảng tbl_chuyennganh
INSERT INTO tbl_chuyennganh VALUES (1, N'Tin học Mỏ', N'');
INSERT INTO tbl_chuyennganh VALUES (2, N'Tin học Trắc địa', N'');
INSERT INTO tbl_chuyennganh VALUES (3, N'Tin học Kinh tế', N'');
INSERT INTO tbl_chuyennganh VALUES (4, N'Tin học Địa chất', N'');
INSERT INTO tbl_chuyennganh VALUES (5, N'Mạng máy tính', N'');
INSERT INTO tbl_chuyennganh VALUES (6, N'Công nghệ phần mềm', N'');
INSERT INTO tbl_chuyennganh VALUES (7, N'Khoa học máy tính ứng dụng ', N'Tuyển sinh từ K60');
GO

--Thêm dữ liệu vào bảng tbl_sinhvien

INSERT INTO tbl_sinhvien VALUES ('1221000100', N'Đỗ Thị Thu Hiền ', '1985-7-16', 1,48, 6, 'dothuhien@yahoo.com ','972836521', N'Yên Bái',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000109', N'Tạ Duy Hiền ', '1987-4-18', 0,50, 4, 'Hien1987@gmail.com ','1658797651', N'Thái Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000110', N'Bùi Thị Thu ', '1984-9-11', 1,47, 1, 'buithu@gmail.com ','977123123', N'Nam Định',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000122', N'Nguyễn Thị Huyền ', '1988-3-25', 1,51, 6, 'thanhhuyen@yahoo.com ','912098077', N'Thái Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000107', N'Tạ Đình Thi ', '1987-9-21', 0,50, 1, 'Dinhthi@yahoo.com ','1222345678', N'Ninh Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000420', N'Nguyễn Đức Minh ', '1986-11-17', 0,49, 6, 'nguyenminh@gmail.com ','983786234', N'Hải Dương',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000311', N'Đỗ Văn Hiếu ', '1984-12-10', 0,47, 1, 'hieudv@gmail.com ','987665667', N'Hải Phòng',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000227', N'Văn Tường Thuật ', '1985-1-9', 0,48, 2, 'vanthuat@gmail.com ','1667781221', N'Quảng Ninh',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000111', N'Nguyễn Trung Tiến ', '1988-7-13', 0,51, 1, 'trungtien@gmail.com ','977543212', N'Hưng Yên',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000113', N'Quách Trung Thành ', '1984-8-12', 0,47, 1, 'Trungthanh84@gmail.com ','1227786763', N'Bắc Ninh',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000410', N'Đỗ Tiến Thành ', '1987-1-15', 0,50, 1, 'Tienthanh.qn@gmail.com ','987665789', N'Quảng Ninh',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000166', N'Nguyễn Văn Lợi ', '1986-12-12', 0,50, 1, 'nguyenvanloi@yahoo.com ','977115654', N'Vĩnh Phúc',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000168', N'Nguyễn Thị Hoài ', '1988-3-19', 1,51, 1, 'Nguyenhoai88@gmail.com ','978654755', N'Lào Cai',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000157', N'Nguyễn Vũ Thành ', '1984-4-5', 0,47, 3, 'Vuthanh84@gmail.com ','1658765664', N'Lạng Sơn',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000143', N'Phạm Trung Kiên ', '1983-9-28', 0,48, 6, 'Trungkien@yahoo.com ','987767234', N'Quảng Ninh',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000185', N'Trần Văn Quảng ', '1989-8-11', 0,52, 4, 'Quangtran89@yahoo.com ','1652347861', N'Hòa Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000119', N'Bùi Văn Kiên ', '1990-10-19', 0,53, 2, 'Kien19101990@gmail.com ','981887770', N'Lào Cai',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000532', N'Nguyễn Bá Long ', '1988-3-11', 0,51, 3, 'balong@gmail.com ','1667889876', N'Thái Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000169', N'Ngô Văn Long ', '1986-1-30', 0,48, 6, 'Longngo86@gmail.com ','977135167', N'Hà Nội',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000125', N'Nguyễn Thị Lệ Quỳnh ', '1986-11-18', 1,49, 1, 'Lequynh86@yahoo.com ','126987125', N'Hải Phòng',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000190', N'Nguyễn Văn Thể ', '1985-10-22', 0,48, 3, 'nguyenthe@gmail.com ','977123776', N'Lai Châu',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000118', N'Lê Văn Định ', '1987-11-12', 0,50, 2, 'Ledinh87@gmail.com ','912887325', N'Hòa Bình',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000174', N'Trần Hoài Nam ', '1988-10-9', 0,51, 6, 'hoainam@yahoo.com ','1268761238', N'Hà Nội',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000183', N'Cao Đình Khôi ', '1985-8-12', 0,48, 5, 'Dinhkhoi85@gmail.com ','912987345', N'Hải Phòng',N'');
INSERT INTO tbl_sinhvien VALUES ('1221000158', N'Đỗ Xuân Huấn ', '1987-10-17', 0,49, 3, 'Xuanhuan87@yahoo.com ','985876234', N'Thái Nguyên',N'');

GO

--Thêm dữ liệu vào tbl_linhvuc
INSERT INTO tbl_linhvuc VALUES (1,N'Phần mềm ứng dụng trên Desktop',N'');
INSERT INTO tbl_linhvuc VALUES (2,N'Phần mềm ứng dụng trên Di động',N'');
INSERT INTO tbl_linhvuc VALUES (3,N'Phần mềm ứng dụng trên nền Web',N'');
INSERT INTO tbl_linhvuc VALUES (4,N'An toàn – Bảo mật thông tin',N'');
INSERT INTO tbl_linhvuc VALUES (5,N'Mạng máy tính',N'');
INSERT INTO tbl_linhvuc VALUES (6,N'Khai thác phần mềm ứng dụng',N'');
INSERT INTO tbl_linhvuc VALUES (7,N'Mã nguồn mở',N'');
INSERT INTO tbl_linhvuc VALUES (8,N'Map-GIS',N'');
INSERT INTO tbl_linhvuc VALUES (9,N'Tự động hóa',N'');
GO

--Thêm dữ liệu vào bảng tbl_giangvien

INSERT INTO tbl_giangvien VALUES ('80501', N'Đặng Quốc Trung ', '1980-7-16', 0, N'Thạc sĩ', 'dangquoctrung@humg.edu.vn ','982836521', N'Bộ môn Tin học Cơ bản');
INSERT INTO tbl_giangvien VALUES ('80502', N'Trần Trung Chuyên ', '1975-10-7', 0, N'Kỹ sư', 'trantrungchuyen@humg.edu.vn ','1667651298', N'Bộ môn Tin học Trắc địa');
INSERT INTO tbl_giangvien VALUES ('80503', N'Nguyễn Tuấn Anh ', '1972-12-26', 0, N'Thạc sĩ', 'nguyentuananh@humg.edu.vn ','987112887', N'Bộ môn Tin học Trắc địa');
INSERT INTO tbl_giangvien VALUES ('80504', N'Đặng Văn Nam ', '1985-7-12', 0, N'Thạc sĩ', 'dangvannam@humg.edu.vn ','986554231', N'Bộ môn Tin học Mỏ');
INSERT INTO tbl_giangvien VALUES ('80505', N'Nguyễn Phương Bắc ', '1980-9-17', 1, N'Thạc sĩ', 'nguyenphuongbac@humg.edu.vn ','1222345678', N'Bộ môn Tin học Mỏ');
INSERT INTO tbl_giangvien VALUES ('80506', N'Nguyễn Thùy Dương ', '1977-8-19', 1, N'Thạc sĩ', 'nguyenthuyduong@humg.edu.vn ','1258879876', N'Bộ môn Tin học Mỏ');
INSERT INTO tbl_giangvien VALUES ('80507', N'Nguyễn Hữu Phương ', '1985-8-12', 1, N'Thạc sĩ', 'nguyenhuuphuong@humg.edu.vn ','976897234', N'Bộ môn Công nghệ phần mềm');
INSERT INTO tbl_giangvien VALUES ('80508', N'Nông Thị Oanh ', '1974-8-10', 1, N'Thạc sĩ', 'nongthioanh@humg.edu.vn ','985234116', N'Bộ môn Tin học Mỏ');
INSERT INTO tbl_giangvien VALUES ('80509', N'Lê Thị Nguyệt ', '1978-9-15', 1, N'Thạc sĩ', 'lethinguyet@humg.edu.vn ','988127776', N'Bộ môn Tin học Kinh tế');
INSERT INTO tbl_giangvien VALUES ('80510', N'Phạm Văn Đồng ', '1980-1-20', 0, N'Thạc sĩ', 'phamvandong@humg.edu.vn ','1258791241', N'Bộ môn Công nghệ phần mềm');
GO

--Thêm dữ liệu vào bảng tbl_doan

INSERT INTO tbl_doan VALUES ('1221000100', N'Nghiên cứu ứng dụng phần mềm Topo và NovaTDN trong thiết kế mở vỉa mỏ đá trắng Mông Sơn, Yên Bình, Yên Bái và xây dựng module quản lý bản vẽ cho các dự án thiết kế mỏ bằng VBA trong AutoCAD', '80502', '80501',6,9.2,2008);
INSERT INTO tbl_doan VALUES ('1221000109', N'Nghiên cứu xây dựng module quản lý lý lịch khoa học cán bộ Trường Đại học Mỏ-Địa chất trên nền mã nguồn mở Joomla', '80501', '80510',7,8.8,2010);
INSERT INTO tbl_doan VALUES ('1221000110', N'Nghiên cứu xây dựng chương trình quản lý các dự án khai thác mỏ ', '80502', '80508',1,7.9,2007);
INSERT INTO tbl_doan VALUES ('1221000122', N'Xây dựng Module hỗ trợ tính toán, kiểm tra và thiết kế mới hệ thống cung cấp điện 6 kV trong công tác khai thác mỏ lộ thiên', '80507', '80505',1,9.4,2011);
INSERT INTO tbl_doan VALUES ('1221000107', N'Xây dựng chương trình quản lý thiết bị cơ điện Công ty than Cọc Sáu ', '80506', '80501',1,9.2,2010);
INSERT INTO tbl_doan VALUES ('1221000420', N'Ứng dụng phần mềm Ventsim tính toán thiết kế mạng thông gió mỏ khu Lộ Trí của Công ty than Thống Nhất – TKV', '80510', '80502',6,8.7,2009);
INSERT INTO tbl_doan VALUES ('1221000311', N'Xây dựng hệ thống quản lý vật tư cho Công ty than Thống Nhất – TKV', '80503', '80504',1,7.5,2007);
INSERT INTO tbl_doan VALUES ('1221000227', N'Xây dựng chương trình quản lý hiện trạng khai thác các mỏ than bùn của tỉnh Hà Tây theo công nghệ GIS', '80504', '80508',8,8.5,2008);
INSERT INTO tbl_doan VALUES ('1221000111', N'Xây dựng chương trình lập hộ chiếu khoan nổ mìn cho khu vực Đông Cao Sơn thuộc Công ty cổ phần than Cao Sơn', '80502', '80509',1,9.4,2011);
INSERT INTO tbl_doan VALUES ('1221000113', N'Xây dựng mô hình 3D hệ thống đường ống công nghệ của nhà máy xử lý nước thải và chất thải rắn Vĩnh Niệm, Thành phố Hải Phòng', '80501', '80507',1,7.9,2007);
INSERT INTO tbl_doan VALUES ('1221000410', N'Xây dựng chương trình quản lý thiết bị máy mỏ Công ty Cổ phần than Vàng Danh – TKV -', '80510', '80506',1,6.3,2010);
INSERT INTO tbl_doan VALUES ('1221000166', N'Xây dựng chương trình quản lý vật tư cho Công ty than Vàng Danh ', '80507', '80503',1,6,2010);
INSERT INTO tbl_doan VALUES ('1221000168', N'Xây dựng chương trình quản lý kinh doanh nước sạch ứng dụng cho huyện Đông Triều - Quảng Ninh', '80502', '80508',1,8.2,2011);
INSERT INTO tbl_doan VALUES ('1221000157', N'Nghiên cứu xây dựng Website thương mại điện tử Công ty Cảng và Kinh doanh than', '80504', '80505',3,9,2007);
INSERT INTO tbl_doan VALUES ('1221000143', N'Nghiên cứu xây dựng hệ thống giám sát một số thông số của hệ thống công nghệ từ máy tính', '80503', '80507',9,7,2008);
INSERT INTO tbl_doan VALUES ('1221000185', N'Nghiên cứu xây dựng module quản lý thư viện Trường Đại học Mỏ - Địa Chất trên nền mã nguồn mở Joomla', '80501', '80504',7,7.8,2012);
INSERT INTO tbl_doan VALUES ('1221000119', N'Xây dựng CSDL phục vụ công tác quản lý hiện trạng sử dụng đất xã Gia Thịnh, huyện Gia Viễn, tỉnh Ninh Bình trong môi trường MapInfo.', '80508', '80502',8,8.5,2013);
INSERT INTO tbl_doan VALUES ('1221000532', N'Xây dựng website bán hàng trực tuyến cho Công ty cổ phần Xây dựng, Thương mại và Kỹ thuật Hợp Nhất FUSICO', '80504', '80510',3,8.9,2011);
INSERT INTO tbl_doan VALUES ('1221000169', N'Nghiên cứu phần mềm Topo-HSMo thành lập bản đồ hiện trạng, tính toán khối lượng đổ thải và quy hoạch, xây dựng mở rộng bãi thải Đông Cao Sơn - Công ty than Cao Sơn.', '80502', '80507',6,9,2008);
INSERT INTO tbl_doan VALUES ('1221000125', N'Ứng dụng phần mềm Gemcom Surpac xây dựng mô hình vi khối và tính toán trữ lượng thân quặng mỏ Bauxit Nhân cơ.', '80506', '80502',6,8.3,2009);
INSERT INTO tbl_doan VALUES ('1221000190', N'Xây dựng website hỗ trợ đào tạo tiếng anh trực tuyến thử nghiệm cho học viện anh ngữ EQUEST', '80504', '80507',3,8.4,2008);
INSERT INTO tbl_doan VALUES ('1221000118', N'Xây dựng phần mềm tra cứu thông tin khoáng vật trên thiết bị di động ', '80507', '80508',2,7.9,2010);
INSERT INTO tbl_doan VALUES ('1221000174', N'Tìm hiểu Joomla và Virtuemart để xây dựng Website bán hàng máy tính cho công ty HT-Tech', '80504', '80501',7,8.6,2011);
INSERT INTO tbl_doan VALUES ('1221000183', N'Xây dựng hệ thống Mail Exchange 2010 cho công ty FPT Telecom ', '80502', '80507',5,9.1,2008);
INSERT INTO tbl_doan VALUES ('1221000158', N'Xây dựng website tuyển dụng cho trung tâm hướng nghiệp và tư vấn việc làm, Trường ĐH Mỏ - Địa chất', '80504', '80508',3,8.8,2009);
GO

-- Tạo stored procedure lấy số lượng học sinh

CREATE PROCEDURE GetHS AS
BEGIN 
 SELECT COUNT(dbo.tbl_sinhvien.MaSV) FROM dbo.tbl_sinhvien
END
GO

-- Tạo stored procedure lấy số lượng giáo viên

CREATE PROCEDURE GetGV AS
BEGIN 
 SELECT COUNT(dbo.tbl_giangvien.MaGV) FROM dbo.tbl_giangvien
END
GO

-- Tạo stored procedure lấy số lượng đồ án

CREATE PROCEDURE GetDA AS
BEGIN 
 SELECT COUNT(MaSV) FROM dbo.tbl_doan
END
GO

--Tạo stored procedure lấy số lượng sv trong các chuyên ngành

CREATE PROCEDURE SLSVien AS
BEGIN
SELECT dbo.tbl_chuyennganh.TenCN, COUNT(dbo.tbl_sinhvien.MaSV) 
FROM dbo.tbl_chuyennganh INNER JOIN dbo.tbl_sinhvien ON tbl_sinhvien.ChuyenNganh = tbl_chuyennganh.MaCN
GROUP BY TenCN
END
GO

--Tạo stored procedure lấy sô chuyên ngành

CREATE PROCEDURE SLChuyenNganh AS
BEGIN
SELECT COUNT(*) FROM dbo.tbl_chuyennganh 
END
GO

--Tạo stored procedure SV theo chuyên ngành

CREATE PROCEDURE ShowSVCN (@mcn TINYINT) AS
BEGIN
SELECT MaSV,TenSV,NamSinh,(CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END),Khoa,TenCN,Email,DienThoai,DiaChi FROM dbo.tbl_sinhvien,dbo.tbl_chuyennganh
WHERE MaCN=ChuyenNganh AND MaCN=@mcn
END
GO

--Tạo stored prosedure đồ án tốt nghiệp theo lĩnh vực 

CREATE PROCEDURE DoAnLV (@linhvuc NVARCHAR(150)) AS
BEGIN
SELECT tbl_doan.MaSV, TenSV, TenDA, CONCAT(GVHD,' - ',a1.TenGV), CONCAT(GVPB,' - ',a2.TenGV), TenLV, Diem, NamTN
FROM dbo.tbl_sinhvien, dbo.tbl_giangvien a1, dbo.tbl_giangvien a2, dbo.tbl_linhvuc, dbo.tbl_doan
WHERE tbl_doan.MaSV = tbl_sinhvien.MaSV AND a1.MaGV = GVHD AND a2.MaGV = GVPB AND LinhVuc = MaLV AND TenLV = @linhvuc
END
GO

--Tạo stored prosedure ds đồ án theo điểm

CREATE PROCEDURE DoAnDiem (@diemBD DECIMAL, @diemKT DECIMAL) AS
BEGIN
SELECT tbl_doan.MaSV, TenSV, TenDA, CONCAT(GVHD,' - ',a1.TenGV), Diem
FROM dbo.tbl_sinhvien, dbo.tbl_giangvien a1, dbo.tbl_doan
WHERE tbl_doan.MaSV = tbl_sinhvien.MaSV AND a1.MaGV = GVHD AND Diem > @diemBD AND Diem <= @diemKT
END
GO

--Tạo stored prosedure đếm số đồ án theo điểm

CREATE PROCEDURE SoDoAn (@diemBD DECIMAL, @diemKT DECIMAL) AS
BEGIN
SELECT COUNT(tbl_doan.TenDA)
FROM dbo.tbl_doan
WHERE Diem > @diemBD AND Diem <= @diemKT
END
GO

--Tạo stored prosedure đếm số đồ án theo lĩnh vực

CREATE PROCEDURE SoDALV AS
BEGIN
SELECT TenLV, COUNT(MaSV)
FROM dbo.tbl_doan INNER JOIN dbo.tbl_linhvuc ON tbl_linhvuc.MaLV = tbl_doan.LinhVuc
GROUP BY TenLV
END
GO

--Tạo stored prosedure hiển thị danh sách sinh viên

CREATE PROC DSSV AS
BEGIN
SELECT MaSV, TenSV, NamSinh, (CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END), Khoa, TenCN, Email, DienThoai, DiaChi
FROM dbo.tbl_sinhvien INNER JOIN dbo.tbl_chuyennganh ON tbl_chuyennganh.MaCN = tbl_sinhvien.ChuyenNganh
END
GO


--Tạo stored prosedure hiển thị danh sách sinh viên theo khóa

CREATE PROC SearchKhoa (@khoa NVARCHAR(10)) AS
BEGIN
SELECT MaSV, TenSV, NamSinh, (CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END), Khoa, TenCN, Email, DienThoai, DiaChi
FROM dbo.tbl_sinhvien INNER JOIN dbo.tbl_chuyennganh ON tbl_chuyennganh.MaCN = tbl_sinhvien.ChuyenNganh INNER JOIN dbo.tbl_khoahoc ON tbl_khoahoc.MaKH = tbl_sinhvien.Khoa
WHERE TenKhoa = @khoa
END
GO

--Tạo stored prosedure hiển thị danh sách sinh viên theo chuyen nganh

CREATE PROC SearchCN (@cn NVARCHAR(50)) AS
BEGIN
SELECT MaSV, TenSV, NamSinh, (CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END), Khoa, TenCN, Email, DienThoai, DiaChi
FROM dbo.tbl_sinhvien INNER JOIN dbo.tbl_chuyennganh ON tbl_chuyennganh.MaCN = tbl_sinhvien.ChuyenNganh
WHERE TenCN = @cn
END
GO

--Tạo proceduce show giảng viên

CREATE PROCEDURE ShowGV AS
BEGIN
SELECT MaGV, TenGV, NamSinh, (CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END), HocVi,Email, DienThoai, DiaChi
FROM dbo.tbl_giangvien
END
GO

--Tạo stored procedure tìm kiếm giảng viên

CREATE PROCEDURE SearchGV (@gv NVARCHAR(50)) AS
BEGIN
SELECT MaGV, TenGV, NamSinh, (CASE GioiTinh WHEN 'true' THEN N'Nam' WHEN 'false' THEN N'Nữ' END), HocVi,Email, DienThoai, DiaChi
FROM dbo.tbl_giangvien
WHERE MaGV LIKE @gv OR HocVi LIKE @gv OR TenGV LIKE @gv OR DiaChi LIKE @gv
END
GO

--Tạo stored procedure thêm mới giảng viên

CREATE PROC InsertGV (@magv CHAR(6), @tengv NVARCHAR(50), @ns DATE, @gt BIT, @hocvi NVARCHAR(50), @email VARCHAR(50), @dt VARCHAR(50), @dc NVARCHAR(150)) AS
BEGIN
INSERT INTO dbo.tbl_giangvien
        ( MaGV, TenGV, NamSinh, GioiTinh, HocVi, Email, DienThoai, DiaChi)
VALUES (@magv, @tengv, @ns, @gt, @hocvi, @email, @dt, @dc)
END
GO

--Tạo stored procedure xem danh sách đồ án

CREATE PROCEDURE ShowDA AS
BEGIN
SELECT tbl_doan.MaSV AS N'Mã sinh viên', TenSV AS N'Tên sinh viên', TenDA AS N'Tên đồ án', CONCAT(GVHD,' - ', a1.TenGV) AS N'Giáo viên hướng dẫn', 
CONCAT(GVPB,' - ', a2.TenGV) AS N'Giáo viên phản biện', TenLV AS N'Tên lĩnh vực', Diem AS N'Điểm', NamTN AS N'Năm tốt nghiệp'
FROM dbo.tbl_sinhvien, dbo.tbl_giangvien a1, dbo.tbl_giangvien a2,dbo.tbl_linhvuc, dbo.tbl_doan
WHERE tbl_doan.MaSV = tbl_sinhvien.MaSV AND a1.MaGV = GVHD AND a2.MaGV = GVPB AND LinhVuc = MaLV
ORDER BY tbl_sinhvien.MaSV
END
GO

--Tạo stored procedure tìm kiếm đồ án theo lĩnh vực

CREATE PROCEDURE SearchDALV (@lv NVARCHAR(150)) AS
BEGIN
SELECT tbl_doan.MaSV AS N'Mã sinh viên', TenSV AS N'Tên sinh viên', TenDA AS N'Tên đồ án', CONCAT(GVHD,' - ', a1.TenGV) AS N'Giáo viên hướng dẫn', 
CONCAT(GVPB,' - ', a2.TenGV) AS N'Giáo viên phản biện', TenLV AS N'Tên lĩnh vực', Diem AS N'Điểm', NamTN AS N'Năm tốt nghiệp'
FROM dbo.tbl_sinhvien, dbo.tbl_giangvien a1, dbo.tbl_giangvien a2,dbo.tbl_linhvuc, dbo.tbl_doan
WHERE tbl_doan.MaSV = tbl_sinhvien.MaSV AND a1.MaGV = GVHD AND a2.MaGV = GVPB AND LinhVuc = MaLV AND TenLV LIKE @lv
ORDER BY tbl_sinhvien.MaSV
END
GO

--Tạo stored procedure tìm kiếm đồ án theo mã giáo viên

CREATE PROCEDURE SearchDAGV (@magv CHAR(6)) AS
BEGIN
SELECT tbl_doan.MaSV AS N'Mã sinh viên', TenSV AS N'Tên sinh viên', TenDA AS N'Tên đồ án', CONCAT(GVHD,' - ', a1.TenGV) AS N'Giáo viên hướng dẫn', 
CONCAT(GVPB,' - ', a2.TenGV) AS N'Giáo viên phản biện', TenLV AS N'Tên lĩnh vực', Diem AS N'Điểm', NamTN AS N'Năm tốt nghiệp'
FROM dbo.tbl_sinhvien, dbo.tbl_giangvien a1, dbo.tbl_giangvien a2,dbo.tbl_linhvuc, dbo.tbl_doan
WHERE tbl_doan.MaSV = tbl_sinhvien.MaSV AND a1.MaGV = GVHD AND a2.MaGV = GVPB AND GVPB = @magv OR GVHD = @magv
ORDER BY tbl_sinhvien.MaSV
END
GO

-----
CREATE PROCEDURE DemSV (@khoa INT) AS
BEGIN 
SELECT COUNT(MaSV)
FROM dbo.tbl_sinhvien
WHERE MaSV = @khoa
END
GO

-----

CREATE PROCEDURE ThemKhoa (@ma TINYINT, @ten NVARCHAR(10),@tg NVARCHAR(50), @kq NVARCHAR(50) OUTPUT)
AS
BEGIN
DECLARE @sl INT
SELECT @sl = COUNT(MaKH) FROM dbo.tbl_khoahoc
WHERE MaKH = @ma
SELECT @kq=@@ROWCOUNT
IF(@sl >1) 
BEGIN
	RETURN @kq
END
ELSE
BEGIN
INSERT INTO dbo.tbl_khoahoc(MaKH, TenKhoa, ThoiGian) VALUES  ( @ma, @ten, @tg)
RETURN @kq
END
END
GO






SELECT * FROM dbo.tbl_khoahoc

DROP PROCEDURE dbo.ThemKhoa

