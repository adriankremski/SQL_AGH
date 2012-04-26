SELECT DISTINCT nazwa 
FROM pudelka NATURAL JOIN zawartosc 
WHERE idczekoladki 
      IN (SELECT idczekoladki FROM czekoladki ORDER BY KOSZT LIMIT 3);
 
SELECT nazwa 
FROM czekoladki 
WHERE koszt 
      = (SELECT max(koszt) FROM czekoladki);


ZADANIE 2
Napisz zapytanie w języku SQL wyświetlające informacje na temat zamówień (data realizacji, idzamowienia) używając odpowiedniego operatora IN/NOT IN/EXISTS/ANY/ALL, które:

a) zostały złożone przez klienta, który ma na imię Antoni,
b) zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
c) zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2008 roku.

SELECT * FROM klienci;
SELECT * FROM zamowienia;
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE idklienta IN ( SELECT idklienta FROM klienci WHERE nazwa ~ 'Antoni');
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE idklienta IN ( SELECT idklienta FROM klienci WHERE ulica ~ '[\d]+/[\d]+');
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE idklienta IN ( SELECT idklienta FROM klienci WHERE miejscowosc ~ 'Krakow') AND extract(month from datarealizacji ) = 11;



ZADANIE 3
Napisz zapytanie w języku SQL wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), używając odpowiedniego operatora IN/NOT IN/EXISTS/ANY/ALL, którzy:

złożyli zamówienia z datą realizacji 12.11.2008,
złożyli zamówienia z datą realizacji w listopadzie 2008,
zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia,
zamówili pudełka, które zawierają czekoladki z migdałami,
złożyli przynajmniej jedno zamówienie,
nie złożyli żadnych zamówień.

SELECT DISTINCT 
  nazwa, ulica, miejscowosc 
FROM 
  klienci 
WHERE 
  idklienta IN (SELECT idklienta FROM zamowienia WHERE datarealizacji = '2008-11-12');

SELECT DISTINCT 
  nazwa, ulica, miejscowosc 
FROM 
  klienci 
WHERE 
  idklienta IN (SELECT idklienta FROM zamowienia WHERE extract(year FROM datarealizacji) = 2008 AND extract(month FROM datarealizacji) = 11);

SELECT DISTINCT 
  nazwa, ulica, miejscowosc 
FROM 
  klienci 
WHERE 
  idklienta IN (SELECT idklienta FROM zamowienia WHERE idzamowienia IN (SELECT idzamowienia FROM artykuly WHERE idpudelka IN (SELECT idpudelka FROM pudelka WHERE nazwa = 'Kremowa fantazja' OR nazwa = 'Kolekcja jesienna'l)));

WITH
  zamowienia_z_wybranymi_czekoladkami AS 
  (
    SELECT 
      idzamowienia, COUNT(idzamowienia) as ilosc 
    FROM 
      artykuly 
    WHERE 
      idpudelka IN
      (   
        SELECT 
          idpudelka 
        FROM 
          pudelka 
        WHERE 
          nazwa = 'Kremowa fantazja' OR nazwa = 'Kolekcja jesienna'
      ) 
    GROUP BY 
      idzamowienia
  ) 
SELECT DISTINCT
  nazwa, ulica, miejscowosc
FROM 
  klienci
WHERE
  idklienta IN
  (
    SELECT 
      idklienta 
    FROM
      zamowienia
    WHERE
      idzamowienia IN
      ( 
        SELECT 
          idzamowienia 
        FROM
          zamowienia_z_wybranymi_czekoladkami 
        WHERE 
          ilosc >= 2
      )
  )

WITH
  pudelka_z_migdalami AS 
  (
    SELECT 
      idpudelka 
    FROM 
      pudelka p
    WHERE 
      EXISTS 
      (
        SELECT idpudelka FROM zawartosc JOIN czekoladki USING(idczekoladki) WHERE idpudelka = p.idpudelka AND rodzajorzechow = 'Migdaly'
      )
  )
SELECT DISTINCT
  nazwa, ulica, miejscowosc
FROM 
  klienci
WHERE
  idklienta IN 
  (
    SELECT
      idklienta
    FROM 
      artykuly 
    JOIN pudelka_z_migdalami USING(idpudelka)
  )
 
 
WITH
  zamowienia_ilosciowe AS 
  (
    SELECT 
      idzamowienia, COUNT(idzamowienia) as ilosc 
    FROM 
      artykuly 
    WHERE 
      idpudelka IN
      (   
        SELECT 
          idpudelka 
        FROM 
          pudelka 
        WHERE 
          nazwa = 'Kremowa fantazja' OR nazwa = 'Kolekcja jesienna'
      ) 
    GROUP BY 
      idzamowienia
  ) 
SELECT DISTINCT
  nazwa, ulica, miejscowosc
FROM 
  klienci
WHERE
  idklienta IN
  (
    SELECT 
      idklienta 
    FROM
      zamowienia
    WHERE
      idzamowienia IN
      ( 
        SELECT 
          idzamowienia 
        FROM
          zamowienia_ilosciowe
        WHERE 
          ilosc >= 1
      )
  )
  select idzamowienia, idklienta from zamowienia ORDER BY idklienta;

WITH
  zamowienia_ilosciowe AS 
  (
    SELECT 
      idklienta, COUNT(idklienta) AS ilosc_zamowien 
    FROM
      zamowienia 
    GROUP BY idklienta
  )
SELECT DISTINCT 
  nazwa, ulica, miejscowosc
FROM 
  klienci k
WHERE
  EXISTS
  (
    SELECT 
      idklienta
    FROM
      zamowienia_ilosciowe
    WHERE
      ilosc_zamowien >= 5 AND idklienta = k.idklienta
  )


SELECT 
  *
FROM 
  klienci
WHERE
  idklienta NOT IN
  (
    SELECT 
      idklienta 
    FROM
      zamowienia
  )

ZADANIE 4
Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (nazwa, opis), używając zarówno złączeń (wiele tabel w klauzuli FROM), jak i podzapytań (używając odpowiedniego operatora IN/NOT IN/EXISTS/ANY/ALL), które znajdują się w:

pudełku o wartości klucza głównego HEAV,
pudełkach, których nazwa zawiera słowo Kolekcja.


SELECT nazwa, opis FROM czekoladki JOIN zawartosc USING(idczekoladki) WHERE idpudelka = 'HEAV';
SELECT nazwa, opis FROM czekoladki WHERE idczekoladki IN (SELECT idczekoladki FROM zawartosc WHERE idpudelka = 'HEAV');

SELECT DISTINCT c.nazwa, c.opis FROM czekoladki c JOIN zawartosc z USING(idczekoladki) JOIN pudelka p ON z.idpudelka = p.idpudelka WHERE p.nazwa ~ '(K|k)olekcja';
SELECT nazwa, opis FROM czekoladki WHERE idczekoladki IN (SELECT idczekoladki FROM zawartosc WHERE idpudelka IN (SELECT idpudelka FROM pudelka WHERE nazwa ~ '(K|k)olekcja'));
