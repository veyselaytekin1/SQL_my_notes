/*
==============================================
       TABLO OLUSTURMA (CRUD islemleri)
==============================================*/
CREATE TABLE students
(id varchar(4) ,
students_name varchar(50),
students_age varchar(25) ,
students_dob date
);

INSERT INTO students VALUES(101, 'ALİ CAN', 13, '2008-10-01' );
INSERT INTO students VALUES(102, 'VELI HAN', 14, '2007-02-09');
INSERT INTO students VALUES(103, 'AYSE TAN', 14, '2007-06-17' );

-- (Y-m-d) '20120101' or '2012-01-01' format.  date formati bu sekilde yazilmali

select * from students


/*
==============================================
       column  sütun ismi degistirme 
==============================================*/
ALTER TABLE students 
RENAME COLUMN sutudents_name TO students_name;



/*
==============================================
      BASKA BIR TABLO KULLANARAK BIR TABLO OLUSTURMA (CRUD islemleri)
==============================================*/

CREATE TABLE students_name_date 
as select students_name, students_age
from students

select * from students_name_date;


/*
==============================================
     SONRADAN BIR COLUMN SÜTUN EKLEMEK
==============================================*/

alter table students
add last_name varchar(40) not null
after students_name;
-- bunu yapinca bir sütun eklendi önceden olanlarin bu sütunu bos kaldi

select * from students






/*
==============================================
     SONRADAN CONSTRAINT ATAMASI YAPMAK
==============================================*/
alter table students
add constraint id_pk primary key(id, students_tel);






