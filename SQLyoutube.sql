CREATE TABLE Kitaplar ( 
    KitapID int not null,
    KitapAd NVARCHAR(50) not null,
    Yazar NVARCHAR(50),
    YayinEvi NVARCHAR(30) not null,
    Fiyat SMALLMONEY not null)   -- youtube videolarindan ders takip ediyorum



CREATE TABLE Kitaplar2 ( 
    KitapID int not null,
    KitapAd NVARCHAR(50) not null,
    Yazar NVARCHAR(50) not null,
    YayinEvi NVARCHAR(30) not null,
    Fiyat SMALLMONEY not null)     -- bu tabloyuda komutlarla degisiklik yaparsak kullanacagiz




-- Kitaplar2 tablosuna yeni bir sutun eklemek icin kullaniyoruz 
-- Alter komutunu veri güncellerken degil, obje degistirirken kullaniyoruz.Alter anlami degistirmek demek
ALTER TABLE Kitaplar2 ADD SayfaSayisi SMALLINT




-- Kitaplar2 tablosundan bir sütunun veri tipini degistirmek icin kullnaiyourz
ALTER TABLE Kitaplar2 ALTER COLUMN SayfaSayisi INT

 
-- Bir tabloyu silmek isterken drop table kullaniyoruz
DROP TABLE Kitaplar2



-- Ben kitaplar tablosundan bir sütun silmek istiyordum.
-- bunu yapmam icin önce tabloyu yakalamam lazim, ALter table ile yakaladm, 
-- Sonra icine girdikten sonra  drop cloumn yaparak siliyorum
ALTER TABLE Kitaplar DROP COLUMN Sayfa



SELECT * FROM Kitaplar
SELECT * FROM Kitaplar2

----------------------------------------------------------------------------------

-- Urunler tablasundaki tüm kayitlari  getiren sorgu

SELECT * FROM Urunler

----------------------------------------------------------------------------------
-- Urunler tablosundan belli sütunlari cagiran sorgu 

SELECT UrunAdi, BirimFiyati, StokMiktari  FROM Urunler


----------------------------------------------------------------------------------
-- Ilk 10 kaydi getiren sorgu
SELECT TOP 10 * FROM Urunler   
-- Tüm bilgiler istenince yildiz koyuyoruz dedi 
-- yani o satirlarla ilgili tüm bilgiler, eger tüm sütunlari degilde, bazi sütunlari isteseydik, * yerine o sütunlarin
-- ismini yazardik

----------------------------------------------------------------------------------
-- bazi tablolari görüntüle
SELECT TOP 40 UrunAdi, BirimFiyati, YeniSatis FROM Urunler    -- Tüm sütunlari tüm bilgileri istemedigim icin yildiz koymadim

----------------------------------------------------------------------------------
-- urunId si 12 olan ürünü görüntüle

SELECT * FROM Urunler WHERE UrunID=12

-- from urunler ile ürünler tablosunu aliyorum,
-- ve select* ile ordaki tüm bilgileri görüntüle
-- ama where ile urunID=12 olanlari görüntüle

SELECT * FROM Urunler WHERE UrunAdi='Chai'
-- bu sekilde string bir ifadeyide bakabiliriz, ama string ifadeleri integer icinde almaliz


SELECT * FROM Urunler WHERE UrunID in (12, 15, 18,25)
-- burda da eger birden fazla ID numarasi yazacaksan bu sekilde kullaniyoruz


----------------------------------------------------------------------------------
SELECT * from Urunler WHERE BirimFiyati > 30 AND BirimFiyati <60

SELECT * from Urunler WHERE BirimFiyati BETWEEN 30 and 60

-- bir araligi secerken bu iki araligi kullanabiliyoruz
 
----------------------------------------------------------------------------------
-- Kategori ID si 1 veya 2 olanlari görüntüle

SELECT * FROM Urunler WHERE KategoriID=1 OR KategoriID=2

-- or kullanimi 

----------------------------------------------------------------------------------
-- Urun adi A harfi ile baslayanlari getir

SELECT * FROM Urunler where UrunAdi  LIKE 'a%'

-- A ile baslayanlari getiriyor, yüzde isareti A'dan sonra herhangi bir harf gelebilir anlamina geliyor

----------------------------------------------------------------------------------

-- Ürun adinda 'A' harfi olan tüm ürünleri görüntüle

SELECT * FROM Urunler where UrunAdi  LIKE '%a%'

-- %a% yazim sekli herhangi bir harf ve icinde A harfi olan Ürunadlarini getirdi


-- Ürun adi A ile baslamayanlari getir

SELECT * FROM Urunler WHERE UrunAdi  not like 'a%'

----------------------------------------------------------------------------------
-- urunAdi  A veya B harfi ile baslayan satirlari getir

SELECT * FROM Urunler where UrunAdi LIKE '[ab]%'

-- bu yazim sekli ile bas harfi A veya B olanlari getiriyor
-- iki harf olunca köseli parantez icine koyuyorum

----------------------------------------------------------------------------------
-- urunAdi A harfinden H harfine kadar olan harflerden biriyle baslayan satirlari görüntüle

SELECT * FROM Urunler WHERE UrunAdi like '[a-h]%'

-- araya tire koyarak beli bir aralik seciyoruz

----------------------------------------------------------------------------------
-- Urun adi a ile biten e birim fiyati 10 ile 30 arasinda olan ürünlerden ilkini görüntüle

SELECT * FROM Urunler WHERE UrunAdi LIKE '%a'  and BirimFiyati BETWEEN 10 and 30

-- ama bu sorguda ilkini göstermedi kosulu saglayanlari gösterdi ilkini göstermek icin, Top 1 yazacagiz

SELECT Top 1 * FROM Urunler WHERE UrunAdi LIKE '%a' and BirimFiyati BETWEEN 10 and 30


----------------------------------------------------------------------------------
-- Distinct Komutu, Tekrarlayan bir sütundaki tekrarlayan verileri göstermez,
-- Hangi müsterilerle satis yaptigimizi gösteren Sorgu

-- normalde musteri ID sütununda birden fazla tekrarlayan verilerimiz var

SELECT MusteriID  FROM Satislar  
 -- bu sekilde ayni kisiye olan her bir satis icin bir satis geliyor
 -- yani eger satis yaptigimiz kisilerin listesini görmek istersek olmaz

SELECT DISTINCT MusteriID FROM Satislar
-- bu sekilde Musteri ID nin yaninda oldugu icin, musteriIdyi Unique olarak getiriyor
-- Distinct den sonra bir sütun ismi girmeliyiz eger MusteriID gibi bir sutun ismi girmezsek,
-- yine tüm satirlari getirir, cünkü isimlerin yaninda birde SatisId var, onlardaki sayilar farkli 
-- SQL bunlari farkli veri olarak algiliyor





-- Eger iki veya daha fazla sütun ile beraber kullancaksan aralarina virgül koyacaksin
-- ve yazdigin sütunlardaki bilgilerin hepsi ayni olursa onlari unique olarak aliyor

SELECT DISTINCT MusteriID, PersonelID FROM Satislar

-- bu sekilde olursa MusteriID ahmet Personel ID 1 ise ayni anda esit olanlari bir satir olarak alir
-- yoksa Ahmet ve Personel ID 3 ise onu farkli olarak alir

----------------------------------------------------------------------------------
-- Urunler Tablosundaki verileri  birim fiyatina göre sirala

SELECT * FROM Urunler ORDER BY  BirimFiyati  -- Default ASC kücükten  büyüge

SELECT * FROM Urunler ORDER BY BirimFiyati ASC -- Kücükten büyüge

SELECT * FROM Urunler ORDER BY BirimFiyati DESC -- Desc Büyükten kücüge

-- bu ifadeyi okurken en bastan okuyabiliriz, Urunler tablosunu al,
-- ama birim miktari ASC olrak siralayarak getir
-- Urun adina görede siralayabiliriz, Alfabetik olarak siralar

SELECT * FROM Urunler ORDER BY UrunAdi 


-- Order by genelde sonlara dogru yazilir, onu önlere yazinca hata veriyor 

----------------------------------------------------------------------------------
-- Stok sayisi 50 den büyük olan ve Kategori ID si ( 1,2,3) olan ürünleri fiyatina göre büyükten kücüge sralayiniz

SELECT * FROM Urunler WHERE HedefStokDuzeyi >50 and  KategoriID in (1,2,3) ORDER BY BirimFiyati DESC



-- Kategori IDsi (1,2,3) olmayanlari görüntüle 

 SELECT * FROM Urunler WHERE KategoriID not in (1,2,3)

----------------------------------------------------------------------------------



-- UNION KULLANIMI:
SELECT OgrAdi, OgrSoyadi FROM TblOgrenci
UNION
SELECT Ad, Soyadi FROM TblKisiler

-- bu sekilde yaptigimiz zamanda iki tabloyu birlestiriyor ve ayni olanlari tek bir satir olarak aliyor
-- aslinda iki tabloyu tekbir rablo olarak birlestirmek istersek bunu kullaniyoruz


SELECT OgrAdi, OgrSoyadi FROM TblOgrenci
UNION ALL
SELECT Ad, Soyadi FROM TblKisiler

-- bu sekilde Union All yaparsak, tüm iki tabloyu sanki uc uca ekliyor, tekrar eden etmeyen ne varsa, ekliyor


----------------------------------------------------------------------------------
-- INTERSECT KULLANIMI
SELECT OgrAdi, OgrSoyadi FROM TblOgrenci
INTERSECT
SELECT Ad, Soyadi FROM TblKisiler

-- burda ise iki tablonun kesisimini aliyor, hangi satirlar ortak ise onlari aliyor


----------------------------------------------------------------------------------
-- EXCEPT KULLANIMI

SELECT OgrAdi, OgrSoyadi FROM TblOgrenci
EXCEPT
SELECT Ad, Soyadi FROM TblKisiler


-- burda Expect öce yazdigindan alttaki tabloyu cikariyor, 
-- ve ortak olan satirlari göstermiyor.


----------------------------------------------------------------------------------
-- UPDATE KULLANIMI

UPDATE Urunler
SET UrunAdi = 'Chai degisti',
WHERE UrunID = 1


----------------------------------------------------------------------------------
-- Urun ID si 1 olan satirin birim fiyatii en yüksek degere güncelle
-- Max degeri kullanmak

UPDATE Urunler
SET BirimFiyati = (SELECT MAX(BirimFiyati) FROM Urunler)
WHERE UrunID = 1

-- urunleriden birim fiyatlarini görüntüle, ve bunlarin MAX olani al ve onuda = ile esitliyoruz
-- Galiba sorgu icinde dorgu yapiyoruz

SELECT * FROM Urunler

SELECT HedefStokDuzeyi  FROM Urunler
WHERE HedefStokDuzeyi= MAX(HedefStokDuzeyi)