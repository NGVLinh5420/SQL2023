# SQL SERVER

   * Trích dẫn viết: `CREATE DATABASE "tên DataBase"`
   
   * Thực tế viết: `CREATE DATABASE QUANLYBDS`

**- CÚ PHÁP SQL ĐỀU VIẾT HOA.**

**- KHÔNG CẦN DẤU ";" KHI KẾT SINTAX.**

**- TÊN BIẾN VIẾT THEO CHUẨN _UpperCase_.**

**- BIẾN hay còn được gọi là CỘT - COLUMN trong TABLE**

**- CÁC BIẾN SẼ LÀ KHOÁ CHÍNH(PK) VÀ KHOÁ PHỤ(FR) PHẢI LÀ _NOT NULL_.**

**- .**

<br>

## Các Cú Pháp - Syntax Cơ Bản

>
>...<br>
CREATE DATABASE - tạo một cơ sở dữ liệu mới<br>
CREATE TABLE - tạo một bảng mới<br><br>
ALTER DATABASE - sửa đổi một cơ sở dữ liệu<br>
ALTER TABLE - được sử dụng để thêm, xóa hoặc sửa đổi các cột; thêm và loại bỏ các ràng buộc trong Table.<br><br>
DELETE- xóa dữ liệu khỏi cơ sở dữ liệu<br>
DROP TABLE- xóa một bảng <br><br>
INSERT INTO - chèn dữ liệu mới vào cơ sở dữ liệu<br>
UPDATE - cập nhật dữ liệu trong cơ sở dữ liệu<br>
SELECT - Liệt kê dữ liệu từ cơ sở dữ liệu <br>
SELECT DISTINCT - Liệt kê ra các Loại của Dữ Liệu: <br>
WHERE - Sử dụng để trích xuất những dữ liệu đáp ứng điều kiện cụ thể.<br><br>
CREATE INDEX- tạo một chỉ mục (khóa tìm kiếm)<br>
DROP INDEX- xóa một chỉ mục<br>
>...
>

## Tạo DATABASE:

```CREATE DATABASE "tên DataBase"```

```DELETE DATABASE "tên DataBase"```
<br>

## Tạo TABLE:

```CREATE TABLE "tên Table" ( "BiếnA, BiếnB" )```

```DELETE TABLE "tên Table"```
<br>

## Ràng Buộc CONSTRAINT

**- Các Ràng Buộc nên được đặt Tên**

* __NOT NULL__ - Đảm bảo rằng cột đó không được để trống giá trị.

* __UNIQUE__ - Đảm bảo rằng tất cả các giá trị trong mọi hàng ở cùng một cột là khác nhau (VD: Số CCCD).

* __PRIMARY KEY__ - Một sự kết hợp của một NOT NULL và UNIQUE. Xác định duy nhất mỗi hàng trong một bảng.

* __FOREIGN KEY__ - Khoá Ngoại và Ngăn chặn các hành động phá hủy liên kết giữa các bảng.

* __CHECK__ - Đảm bảo rằng các giá trị trong một cột thỏa mãn một điều kiện cụ thể.

* __DEFAULT__ - Đặt giá trị mặc định cho một cột nếu không có giá trị nào được chỉ định.

* __CREATE INDEX__ - Dùng để tạo và lấy dữ liệu từ cơ sở dữ liệu rất nhanh.

**- Syntax có sự thay đổi ở 'Điều Kiện' theo mỗi loại Ràng Buộc**

**- Trong Table:**

     CREATE TABLE "Table" 
     (
        ID INT "Ràng Buộc" ('Điều Kiện', ...),
        ...
     )
     
     OR
     
     CREATE TABLE "Table" 
     (
        ID INT,
        ...,
        "Ràng Buộc" ( 'Điều Kiện', ...)
     )
     
     OR
     
     CREATE TABLE "Table" 
     (
        ID INT,
        CONSTRAINT "CT_tên ràng buộc" "Ràng Buộc" ( 'Điều Kiện', ...)
     )
     
**- Ngoài Table:**          
     
     ALTER TABLE "Table"
     ADD "Ràng Buộc" ('Điều Kiện', ...)
     
     OR
     
     ALTER TABLE "Table"
     ADD CONSTRAINT CT_"tên" "Ràng Buộc" ('Điều Kiện', ...)
     
     
**khác biệt:**

    //Dùng cho NOT NULL     
    ALTER TABLE Persons
    ALTER COLUMN Age int NOT NULL
    
    //Dùng cho DEFAULT
    ALTER TABLE Persons
    ADD CONSTRAINT df_City
    DEFAULT 'Sandnes' FOR City

**- DROP CONSTRAINT:**

    ALTER TABLE "Table"
    DROP CONSTRAINT "Tên ràng buộc"
    
    ALTER TABLE "Table"
    ALTER COLUMN "Cột" DROP "Ràng Buộc"
    //Dành cho các Ràng buộc không cần đặt tên: PK, NOT NULL, DEFAULT, 
    

<br>

## Tạo Khoá Chính PRIMARY KEY:

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
    
    OR
    
    (
        ...,
        CONSTRAINT PK_"tên" PRIMARY KEY (Column, ...)
        
    )

**- Ngoài Table:**

    ALTER TABLE "Table"
    ADD PRIMARY KEY (ID, ...);
    
    OR
    
    ALTER TABLE "Table"
    ADD CONSTRAINT PK_"tên khoá chính" PRIMARY KEY (ID, ...)
    //Đặt tên cho Khoá Chính khi cần thiết.


## Tạo Khoá Ngoại FOREIGN KEY

* __Syntax:__ `FOREIGN KEY REFERENCES "Table"("Biến")`
* __REFERENCES:__ Tham chiếu đến Table có Biến-Là Khoá Chính của Table đó.
* __Nên đặt tên cho Khoá Phụ "FK_'tên' ".__
* __Một Table có thể tự tạo Khoá Phụ cho chính Nó.__
* __Biến đặt làm Khoá Phụ ở hai "Table" nên đặt cùng *Tên*, *Kiểu Dữ Liệu*, *Kích Thước Kiểu Dữ Liệu* và *NOT NULL*__

**- Trong Table:**

    (
        ID int FOREIGN KEY REFERENCES "Table"(ID),
        ...
    )
    
    OR
    
    (
        ...,
        FOREIGN KEY (ID, ...) REFERENCES "Table"(ID, ...)
    )
    
    OR
    
    (
        ...,
        CONSTRAINT "FK_tên khoá phụ" FOREIGN KEY (ID, ...) REFERENCES "Table"(ID, ...)
        //Nên đặt tên cho Khoá Ngoại.
        
    )

**- Ngoài Table:** 

    ALTER TABLE "Table_1"
    ADD FOREIGN KEY (ID, ...) REFERENCES "Table2"(ID, ...);
    
    OR
    
    ALTER TABLE "Table_1"
    ADD CONSTRAINT "FK_tên Khoá Phụ" FOREIGN KEY (ID, ...) REFERENCES "Table_2"(ID, ...)
    //Nên đặt tên cho Khoá Ngoại.

**- Xoá FK:** `ALTER TABLE "Table" DROP CONSTRAINT "Tên Khoá Phụ"`

<br>

## Sửa TABLE - ALTER TABLE

* Thêm một cột (Biến)  : `ALTER TABLE "Table" ADD "tên Cột" "Kiểu Dữ Liệu"` <br>

* Xóa một cột         : `ALTER TABLE "Table" DROP COLUMN "tên Cột"`<br>

* Đổi tên một cột     : `ALTER TABLE "Table" RENAME COLUMN "tên Cột" TO "tên Mới"` <br>

* Sửa cột: `ALTER TABLE "Table" ALTER COLUMN "tên Cột" "KDL" "Ràng Buộc"` <br>

<br>

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
    
<br>

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

## Liệt Kê - SELECT

**- Syntax:**

    SELECT "column1", "column2", ...
    FROM "Table"  

**- Liệt kê tất cả các Cột:** Có thể kèm theo ĐK

    SELECT * FROM "Table"
    WHERE "điều kiện" 


**- Liệt kê theo Loại:** Dữ liệu lệt kê ra Không Trùng Nhau.

   SELECT DISTINCT "column1", "column2", ...
   FROM "Table"

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


## 

## 
















