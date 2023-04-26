# SQL SERVER

   * Trích dẫn viết: `CREATE DATABASE "tên DataBase"`
   
   * Thực tế viết: `CREATE DATABASE QUANLYBDS`

**- CÚ PHÁP SQL ĐỀU VIẾT HOA.**

**- KHÔNG CẦN DẤU ";" KHI KẾT SINTAX.**

**- TÊN BIẾN VIẾT THEO CHUẨN _UpperCase_.**

**- CÁC BIẾN SẼ LÀ KHOÁ CHÍNH(PK) VÀ KHOÁ PHỤ(FR) PHẢI LÀ _NOT NULL_.**

**- .**

<br>

## Các Cú Pháp - Syntax Cơ Bản

>
>...<br>
CREATE DATABASE- tạo một cơ sở dữ liệu mới<br>
CREATE TABLE- tạo một bảng mới<br><br>
ALTER DATABASE- sửa đổi một cơ sở dữ liệu<br>
ALTER TABLE- sửa đổi một bảng<br><br>
DELETE- xóa dữ liệu khỏi cơ sở dữ liệu<br>
DROP TABLE- xóa một bảng<br><br>
INSERT INTO- chèn dữ liệu mới vào cơ sở dữ liệu<br>
UPDATE- cập nhật dữ liệu trong cơ sở dữ liệu<br>
SELECT- trích xuất dữ liệu từ cơ sở dữ liệu<br><br>
CREATE INDEX- tạo một chỉ mục (khóa tìm kiếm)<br>
DROP INDEX- xóa một chỉ mục<br>
>...
>

## Tạo DATABASE: `CREATE DATABASE "tên DataBase"`
`DELETE DATABASE "tên DataBase"`

## Tạo TABLE: `CREATE TABLE "tên Table" ( "BiếnA, BiếnB" )`
`DELETE TABLE "tên Table"`

## Tạo PRIMARY KEY:

**- Trong Table:**

    (
        MaNV NVARCHAR(10) NOT NULL PRIMARY KEY,
        ...
    )
    
    OR
    
    (
        ...,
        PRIMARY KEY (ID, MaNV, MaSP, ...)
    )

**- Ngoài Table:**

    ALTER TABLE "tên Table"
    ADD PRIMARY KEY (ID, ...);
    
    OR
    
    ALTER TABLE "tên Table"
    ADD CONSTRAINT PK_"tên khoá" PRIMARY KEY (ID, ...);
    //Đặt tên cho khoá chính khi cần thiết.

## Tạo FOREIGN KEY

**- Trong Table:**

    (        
        ...,
        MaNV NVARCHAR(10) NOT NULL PRIMARY KEY,
        ...
    )
    
    OR
    
    (
        ...,
        PRIMARY KEY (ID, MaNV, MaSP, ...)
    )

**- Ngoài Table:**

    ALTER TABLE "tên Table"
    ADD PRIMARY KEY (ID, ...);
    
    OR
    
    ALTER TABLE "tên Table"
    ADD CONSTRAINT PK_"tên khoá" PRIMARY KEY (ID, ...);
    //Đặt tên cho khoá chính khi cần thiết.


## 

## 















