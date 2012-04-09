/** ZAD 1 **/
SELECT * FROM czekoladki;
SELECT * FROM klienci;
INSERT INTO czekoladki VALUES ('W98','Bialy kiel','Biala','Laskowe','Marcepan','Rozplywajace sie w rekach i kieszeniach','0.45','20');
INSERT INTO klienci VALUES ('90','Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 324 45 38');
INSERT INTO klienci VALUES ('91','Matusiak Alina', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 324 45 38');
INSERT INTO klienci VALUES ('92','Kimono Franek', 'Karatektow 8', 'Mistrz', '30-029', '501 498 324');
/** ZAD 2 **/
INSERT INTO czekoladki VALUES ('X91', 'Nieznajoma', NULL, NULL, NULL, 'Niewidzialna czekoladka wspomagajaca odchudzanie', '0.20', '0');
INSERT INTO czekoladki VALUES ('M98', 'Mleczny raj', 'Mleczna', NULL, NULL, 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem', '0.26', '36');
/** ZAD 3 **/
DELETE FROM czekoladki WHERE idczekoladki='X91' or idczekoladki='M98';
INSERT INTO czekoladki (idczekoladki, nazwa, opis, koszt, masa) VALUES('X91', 'Nieznana Nieznajoma', 'Niewidzialna czekoladka wspomagajaca odchudzanie', '0.26', '0');
INSERT INTO czekoladki (idczekoladki, nazwa, rodzajczekolady, opis, koszt, masa) VALUES('M98', 'Mleczny Raj','Mleczna','Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem', '0.26', '36');
/** ZAD 4 **/
INSERT INTO klienci SELECT '93', 'Matusiak Iza', ulica, miejscowosc, kod, telefon FROM klienci where nazwa='Matusiak Edward';
/** ZAD 5 **/
UPDATE klienci SET nazwa='Nowak Iza' WHERE idklienta='93';
/** ZAD 6 **/
UPDATE klienci SET miejscowosc='Piotograd' WHERE miejscowosc='Leningrad';
/** ZAD 7 **/
UPDATE czekoladki SET koszt = koszt * 0.1 WHERE idczekoladki IN ('W98','M98','X91');
/** ZAD 8 **/
UPDATE czekoladki SET koszt = (SELECT koszt FROM czekoladki WHERE idczekoladki='W98') WHERE nazwa='Nieznana Nieznajoma';
UPDATE czekoladki SET koszt = koszt + 0.15 WHERE idczekoladki ~ '.9[1-9]{1}$';
/** ZAD 9 **/
DELETE FROM klienci WHERE nazwa ~ 'Matusiak' OR idklienta > 91;
/** ZAD 10 **/
DELETE FROM czekoladki WHERE koszt >= 0.45 OR masa >= 36 OR masa = 0;
/** ZAD 11 **/
INSERT INTO pudelka VALUES ('LULZ','Only for lulz','Only for lulz', '0', 200 );
INSERT INTO zawartosc VALUES('LULZ','B02','4');
INSERT INTO zawartosc VALUES('LULZ','B04','4');
INSERT INTO pudelka VALUES ('CHAN','4chan powah', '4chan powah', '0', 100);
INSERT INTO zawartosc VALUES('CHAN','B02','4');
INSERT INTO zawartosc VALUES('CHAN','B04','4');
/** ZAD 12 **/
UPDATE zawartosc SET sztuk = sztuk + 1 WHERE idpudelka IN ('LULZ','CHAN');
/** ZAD 13 **/
UPDATE czekoladki SET rodzajczekolady = 'brak' WHERE rodzajczekolady IS NULL;
UPDATE czekoladki SET rodzajorzechow = 'brak' WHERE rodzajorzechow IS NULL;
UPDATE czekoladki SET rodzajnadzienia = 'brak' WHERE rodzajnadzienia IS NULL;
/** ZAD 14 **/
UPDATE czekoladki SET rodzajczekolady = NULL WHERE rodzajczekolady = 'brak';
UPDATE czekoladki SET rodzajorzechow = NULL WHERE rodzajorzechow = 'brak';
UPDATE czekoladki SET rodzajnadzienia = NULL WHERE rodzajnadzienia = 'brak';
