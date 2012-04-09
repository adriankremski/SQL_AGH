/** ZAD 2 **/
SELECT * FROM klienci;
SELECT * FROM zamowienia;

SELECT k.idklienta, k.nazwa, z.idklienta, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z WHERE k.nazwa ~ 'Antoni';

SELECT k.nazwa, k.ulica, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z WHERE k.ulica ~ '[0-9]+\/[0-9]+';

SELECT k.idklienta, k.nazwa, k.miejscowosc, z.idklienta, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z WHERE k.miejscowosc = 'Krakow' AND z.datarealizacji >= '2008-11-01' AND z.datarealizacji <= '2008-11-30';

/** ZAD 3 **/
SELECT k.idklienta, k.nazwa, k.ulica, k.miejscowosc, z.idklienta, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z WHERE z.datarealizacji = '2008-11-12';

SELECT k.idklienta, k.nazwa, k.ulica, k.miejscowosc, z.idklienta, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z WHERE z.datarealizacji >= '2008-11-01' AND z.datarealizacji <= '2008-11-30';

SELECT k.idklienta, k.nazwa, z.idklienta, z.idzamowienia, a.idzamowienia, a.idpudelka, p.idpudelka, p.nazwa FROM klienci k, zamowienia z, artykuly a, pudelka p WHERE k.idklienta = z.idklienta AND z.idzamowienia = a.idzamowienia AND a.idpudelka = p.idpudelka AND (p.nazwa = 'Kremowa fantazja' OR p.nazwa = 'Kolekcja jesienna');

SELECT k.idklienta, k.nazwa, z.idklienta, z.idzamowienia, a.idzamowienia, a.idpudelka, a.sztuk, p.idpudelka, p.nazwa FROM klienci k, zamowienia z, artykuly a, pudelka p WHERE k.idklienta = z.idklienta AND z.idzamowienia = a.idzamowienia AND a.idpudelka = p.idpudelka AND a.sztuk >= 2 AND (p.nazwa = 'Kremowa fantazja' OR p.nazwa = 'Kolekcja jesienna');

SELECT k.idklienta, k.nazwa, z.idklienta, z.idzamowienia, a.idzamowienia, a.idpudelka, za.idpudelka, za.idczekoladki, c.idczekoladki, c.rodzajorzechow  FROM klienci k, zamowienia z, artykuly a, zawartosc za, czekoladki c WHERE k.idklienta = z.idklienta AND z.idzamowienia = a.idzamowienia AND a.idpudelka = za.idpudelka AND za.idczekoladki = c.idczekoladki AND c.rodzajorzechow ~ 'Migdaly';

SELECT z.idklienta, k.idklienta, k.nazwa, COUNT(*) FROM klienci k, zamowienia z WHERE k.idklienta = z.idklienta GROUP BY z.idklienta, k.idklienta, k.nazwa HAVING COUNT(z.idklienta) >= 1 ;
/** 5 **/

/** ZAD 4 **/
SELECT p.idpudelka, p.nazwa, p.opis, z.idpudelka, z.idczekoladki, c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki;

SELECT p.idpudelka, p.nazwa, p.opis, z.idpudelka, z.idczekoladki, c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = 'HEAV' AND p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki;

SELECT p.idpudelka, p.nazwa, p.opis, z.idpudelka, z.idczekoladki, c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.nazwa ~ 'Kolekcja' AND p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki;

/** ZAD 5 **/
SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.idczekoladki = 'D09';

SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.nazwa = 'Gorzka truskawkowa';

SELECT COUNT(*), p.nazwa, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.nazwa ~ '^S' GROUP BY p.nazwa, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis HAVING COUNT(z.idczekoladki) >= 1;

SELECT COUNT(*), p.nazwa, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki GROUP BY p.nazwa, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis HAVING COUNT(z.idczekoladki) >= 4;

SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND z.sztuk >= 3 AND c.nazwa = 'Gorzka truskawkowa';

SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.rodzajnadzienia, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.rodzajnadzienia ~ 'Truskawki' ;

SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.rodzajczekolady, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.rodzajczekolady !~ 'Gorzka';

SELECT p.idpudelka, p.nazwa, z.idpudelka, z.idczekoladki, z.sztuk,  c.idczekoladki, c.nazwa, c.rodzajorzechow, c.opis FROM pudelka p, zawartosc z, czekoladki c WHERE p.idpudelka = z.idpudelka AND z.idczekoladki = c.idczekoladki AND c.rodzajorzechow IS NULL;
/** punkt 9 **/

/** ZAD 6 **/
/** ZAD 7 **/
