## Các Cú Pháp - Syntax Cơ Bản
```SQL
CREATE DATABASE - tạo một cơ sở dữ liệu mới.
CREATE TABLE - tạo một bảng mới.
ALTER DATABASE - sửa đổi một cơ sở dữ liệu.
ALTER TABLE - được sử dụng để thêm, xóa hoặc sửa đổi các cột; thêm và loại bỏ các ràng buộc trong Table.
DELETE - xóa dữ liệu khỏi cơ sở dữ liệu.
DROP TABLE - xóa một bảng.
INSERT INTO - chèn dữ liệu mới vào cơ sở dữ liệu.
UPDATE - Cập nhật dữ liệu trong cơ sở dữ liệu.
SELECT - Liệt kê dữ liệu từ cơ sở dữ liệu.
SELECT DISTINCT - Liệt kê ra các Loại của Dữ Liệu.
WHERE - Sử dụng để trích xuất những dữ liệu đáp ứng điều kiện cụ thể.
CREATE INDEX - tạo một chỉ mục (khóa tìm kiếm).
DROP INDEX- xóa một chỉ mục.
```

## TẠO-XOÁ DATABASE:
```SQL
CREATE DATABASE NHANSU;

--
DROP DATABASE NHANSU;
```
## TẠO-XOÁ TABLE:

```SQL
CREATE TABLE NHANVIEN
(
   ID VARCHAR(10),
   COUNT INT
)

DROP TABLE NHANVIEN;
```

## RÀNG BUỘC CONSTRAINT

* __NOT NULL__ - Đảm bảo rằng cột đó không được để trống giá trị.
* __PRIMARY KEY__ - Một sự kết hợp của một NOT NULL và UNIQUE. Xác định duy nhất mỗi hàng trong một bảng.
* __FOREIGN KEY__ - Khoá Ngoại và Ngăn chặn các hành động phá hủy liên kết giữa các bảng.
* __UNIQUE__ - Đảm bảo rằng tất cả các giá trị trong mọi hàng ở cùng một cột là khác nhau (VD: Số CCCD).
* __CHECK__ - Đảm bảo rằng các giá trị trong một cột thỏa mãn một điều kiện cụ thể.
* __DEFAULT__ - Đặt giá trị mặc định cho một cột nếu không có giá trị nào được chỉ định.
* __CREATE INDEX__ - Dùng để tạo và lấy dữ liệu từ cơ sở dữ liệu rất nhanh.

* __CÁCH THÊM RÀNG BUỘC:__

**- Trong Table:**
```SQL
     CREATE TABLE NHANVIEN 
     (
        ID INT NOT NULL,
        Ten VARCHAR(50) UNIQUE,
        Tuoi int CHECK (Age>18),
        QuocTich VARCHAR(50) DEFAULT 'VietNam'
     )
     
     Hoặc
     
     CREATE TABLE NHANVIEN 
     (
        ID INT NOT NULL,
        Ten VARCHAR(50),
        Tuoi int,
        QuocTich VARCHAR(50),
        
        UNIQUE (Ten),
        CHECK (Tuoi>18 AND Tuoi<40),
        --Không hỗ trợ DEFAULT.
     )
     
     Nên
     
     CREATE TABLE NHANVIEN 
     (
        ID INT NOT NULL,
        Ten VARCHAR(50),
        Tuoi INT,
        QuocTich VARCHAR(50),
        
        CONSTRAINT UQ_NHANVIEN UNIQUE (ID,Ten),
        CONSTRAINT CK_NHANVIEN_Tuoi CHECK (Tuoi>18 AND Tuoi<40)
        --Không hỗ trợ DEFAULT.
     )
```
     
**- Ngoài Table:**          
```SQL
     ALTER TABLE NHANVIEN
     ALTER COLUMN Age int NOT NULL;
     go
     
     ALTER TABLE NHANVIEN
     ADD CONSTRAINT UQ_NHANVIEN UNIQUE (ID,Ten)
     go
     
     ALTER TABLE NHANVIEN
     ADD CONSTRAINT CK_NHANVIEN CHECK (Age>=18 AND Ten='Sandnes')
     go
     
     ALTER TABLE NHANVIEN
     ADD CONSTRAINT DF_NHANVIEN_QuocTich
     DEFAULT 'Sandnes' FOR QuocTich;
     go
```

**- XOÁ CONSTRAINT:**
```SQL
    --Cách Xoá NOT NULL
    ALTER TABLE NHANVIEN
    ALTER COLUMN Age int NULL
    go
    
    --Dành cho các Ràng buộc có đặt tên.
    ALTER TABLE NHANVIEN
    DROP CONSTRAINT [Tên Ràng Buộc: CK_NHANVIEN_Tuoi]
    
    
```  

## KHOÁ CHÍNH PRIMARY KEY:

--Phải đặt tên cho Khoá Chính, tương lại Sửa-Xoá dễ dàng hơn.

**- Trong Table:**
```SQL
    (
        ID NVARCHAR(10) NOT NULL PRIMARY KEY
    )
    
    Hoặc
    
    (
        ...,
        PRIMARY KEY (ID, MaNV, MaSP, ...)
    )
    
    Nên
    
    (
        ...,
        CONSTRAINT PK_NHANVIEN_ID PRIMARY KEY (ID, MaNV, MaSP, ...)
    )
```

**- Ngoài Table:**
```SQL
    ALTER TABLE NHANVIEN
    ADD PRIMARY KEY (ID);
    
    Hoặc
    
    ALTER TABLE NHANVIEN
    ADD CONSTRAINT PK_ID PRIMARY KEY (ID)
```
**- Xoá Khoá Chính:**
```SQL
   ALTER TABLE NHANVIEN
   DROP CONSTRAINT PK_ID
   go
```

## TẠO KHOÁ NGOẠI FOREIGN KEY

* __Biến đặt làm Khoá Phụ, ở hai "Table" nên đặt cùng *Tên*, *Kiểu Dữ Liệu*, *Kích Thước Kiểu Dữ Liệu* và có sẵn *NOT NULL*__

**- Trong Table:**
```SQL
    (
        ID int FOREIGN KEY REFERENCES PHONG(ID)
    )
    
    Hoặc
    
    (
        ...,
        FOREIGN KEY (ID) REFERENCES NHANVIEN(ID)
    )
    
    Hoặc
    
    (
        ...,
        CONSTRAINT FK_TÊN FOREIGN KEY (ID) REFERENCES NHANVIEN(ID)
        --Phải đặt tên cho Khoá Ngoại.
    )
```

**- Ngoài Table:** 
```SQL
    ALTER TABLE NHANVIEN
    ADD FOREIGN KEY (MaPH) REFERENCES PHONG(MaPH)
    go
    
    Hoặc
    
    ALTER TABLE NHANVIEN
    ADD CONSTRAINT FK_MaPH FOREIGN KEY (MaPH) REFERENCES PHONG(MaPH)
    go
```
**- Xoá Khoá Ngoại:** 
```SQL
ALTER TABLE NHANVIEN DROP CONSTRAINT FK_MaPH
go
```

## SỬA TABLE - ALTER TABLE

* __Thêm Cột:__ 
```SQL
ALTER TABLE NHANVIEN ADD NamSinh DATETIME
```

* __Xóa Cột:__ 
```SQL
ALTER TABLE NHANVIEN DROP COLUMN NamSinh
```

* __Đổi Tên Cột:__
```SQL
ALTER TABLE NHANVIEN RENAME COLUMN NamSinh to NgaySinh
```

* __Sửa KDL Cột:__ 
```SQL
ALTER TABLE NHANVIEN ALTER COLUMN NgaySinh VARCHAR(50)
```

## Chèn Dữ Liệu Vào TABLE - INSERT INTO

__- Syntax:__

    INSERT INTO "Table" (Column1, Column2, Column3, ...)
    VALUES (Value1, Value2, Value3, ...)    
    
__- Chèn tự động Tất Cả các Cột:__ *Có bao nhiêu Cột, có bấy nhiêu Value*
     
    INSERT INTO "Table" 
    VALUES (Value1, Value2, Value3, ...);
    
__- Chỉ chèn vào một vài Cột:__

    INSERT INTO "Table" (ID1, ID3, ID12)
    VALUES (value1, value3, value12)
    

## Cập Nhật Dữ Liệu Cho TABLE - UPDATE/ WHERE/ AND-OR-NOT

__- Syntax:__

    UPDATE "Table"
    SET "Column2 = value2", "Column3 = value3", ...
    WHERE "Column1 = value1"
    
    //Chỉ cập nhật Cột 2-3 tại Hàng có Cột 1 = Value1.

**Nếu không có điều kiện *WHERE* thì tất cả các Hàng sẽ được cập nhật lại giống hệt nhau.**

**- AND: Các điều kiện nên khác Cột với nhau.**

    UPDATE "Table"
    SET "Column2 = value2", "Column3 = value3", ...
    WHERE "Column1 = value1" AND "Column2 = value2"

**- OR: Các điều kiện có thể cùng Cột với nhau.**

    UPDATE "Table"
    SET "Column2 = value2", "Column3 = value3", ...
    WHERE "Column1 = value1-2" OR "Column1 = value1-5"

**- NOT: Ngoại Trừ**

    UPDATE "Table"
    SET Column2 = value2, Column3 = value3, ...
    WHERE NOT "Column1 = value1-10"

**- Các điều kiện có thể sử dụng kết hợp cùng nhau.**

<br>

## Liệt Kê và Toán Tử - SELECT

**- Syntax:**
```SQL
    SELECT NV.ID, NV.Ten, P.ChucVu
    FROM NHANVIEN NV, PHONG P
    WHERE NV.ID=P.ID
```

**- Liệt kê tất cả các Cột:** Có thể kèm theo ĐK
```SQL
    SELECT * 
    FROM NHANVIEN
    WHERE ID>1
```

**- Liệt kê theo Loại:** Dữ liệu lệt kê ra Không Trùng Nhau.

    SELECT DISTINCT "column1", "column2", ...
    FROM "Table"

**- Toá Tử:**

* LIKE GIỐNG =
* IS
* <> KHÁC
* TOP - ORDER BY

## Sắp Xếp Theo Thứ Tự - ORDER BY:

**Mặc định là tăng dần (ASC)**
**DESC là giảm dần**

**- Syntax:**

    SELECT column1, column2, ...
    FROM "Table"
    ORDER BY column1, column2, ... ASC|DESC

**- Sắp xếp Table theo Thứ tự của Cột:**

    SELECT * FROM Customers
    ORDER BY Column1, Column2 DESC, Column3 ASC, ....
    //Mặc định tăng dần.


















