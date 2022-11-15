/*
==============================================
       TABLO OLUSTURMA (CRUD islemleri)
==============================================*/
use sys;
 CREATE TABLE students
 (id varchar(4) PRIMARY KEY,
 students_name varchar(50) NOT NULL,
 students_age varchar(25)
);
-- parantez sonundaki noktali virgülün yanina gelip simsek I ya basarsan o parantez icindeki blogu calistirir
-- veya calistiracagin seyi secili hale getirip, simsek'e basarsan oda calisir

INSERT INTO students VALUES(101, 'ALİ CAN', 13);
INSERT INTO students VALUES(102, 'VELI HAN', 14);
INSERT INTO students VALUES(103, 'AYSE TAN', 14);

select * from students

-- tabloyu bir defa kaydediyor, eger yeniden ayni isimli bir table kaydetmek istersen öncekini silmelisin



/*
==============================================
       BASKA BIR TABLO KULLANARAK YENI TABLO OLUSTURMA
==============================================*/

--# select seciyor,from getiriyor,ikisini yazınca hem seçip hem getiriyor
create table students_name_age
as select students_name, students_age 
from students;

select * from students_name_age;
