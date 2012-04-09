/** ZAD 9 **/
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY nazwa;
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY miejscowosc DESC;
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY miejscowosc DESC, nazwa ASC;
SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc='Krakow' ORDER BY nazwa;
SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc='Krakow' or miejscowosc='Warszawa' ORDER BY nazwa ASC;
SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc in ('Krakow','Warszawa') ORDER BY nazwa ASC;
/** ZAD 10 **/
SELECT * FROM czekoladki;
SELECT nazwa, masa FROM czekoladki WHERE masa > 20;
SELECT nazwa, koszt FROM czekoladki WHERE koszt > 0.25;
SELECT nazwa, masa, koszt FROM czekoladki WHERE masa > 20 AND koszt > 0.25;
SELECT nazwa, rodzajczekolady FROM czekoladki WHERE rodzajczekolady IN ('Gorzka', 'Biala');
