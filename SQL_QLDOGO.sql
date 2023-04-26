CREATE DATABASE QLDOGO

Create table LoaiGo
(
MaLoai nvarchar(10) not null primary key,
TenLoai nvarchar(50)
)

Create table DoGo
(
MaDG nvarchar(10) not null primary key,
TenDG nvarchar(50),
MaLoai nvarchar(10) not null,
Gia nvarchar(50)
)

Alter table DoGo
Add constraint FR_DG_LG_MaLoai
foreign key (MaLoai)
references LoaiGo (MaLoai)

Create table MauGo
(
MaMau nvarchar(10)not null primary key,
TenMau nvarchar(50)
)

Create table ThanhPhan
(
MaTP nvarchar(10) not null primary key,
TenTP nvarchar(50),
KichThuoc int
)

create table TuongThich
(
MaLoai nvarchar(10) not null,
MaMau nvarchar(10) not null,
primary key(MaLoai, MaMau)
)

Alter table TuongThich
Add constraint FR_TT_LG_MaLoai
foreign key (MaLoai)
references LoaiGo (MaLoai)
 
Alter table TuongThich
Add constraint FR_TT_MG_MaMau
foreign key (MaMau)
references MauGo (MaMau)

create table TP_Loai
(
MaTP nvarchar(10) not null,
MaLoai nvarchar(10) not null,
DonGia int,
primary key(MaTP, MaLoai)
)
 
Alter table TP_Loai
Add constraint FR_TPL_TP_MaTP
foreign key (MaTP)
references ThanhPhan (MaTP)

Alter table TP_Loai
Add constraint FR_TPL_LG_MaLoai
foreign key (MaLoai)
references LoaiGo (MaLoai)
	
create table CauThanhDG
(
MaTP nvarchar(10) not null,
MaDG nvarchar(10) not null,
SoLuong int,
primary key(MaTP, MaDG)
)

Alter table CauThanhDG
Add constraint FR_CTDG_TP_MaTP
foreign key (MaTP)
references ThanhPhan (MaTP)

Alter table CauThanhDG
Add constraint FR_CTDG_DG_MaDG
foreign key (MaDG)
references DoGo (MaDG)