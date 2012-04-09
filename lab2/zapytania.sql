/** ZAD 1 **/
SELECT * FROM czekoladki;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa LIKE 'S%';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa LIKE 'Slod%';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa LIKE 'S%i';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa LIKE '%m%';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa LIKE 'S% %m%';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa SIMILAR TO '(A|B|C)%';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa SIMILAR TO '(Orzech%)|(%orzech%)';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa NOT SIMILAR TO '[D-KS-T]%';

SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^S';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^Slod';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^S.*i$';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '.*m.*';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^S.* ([m].*)+';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^(A|B|C).*';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '(^Orzech)|(orzech)';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '(maliny|truskawki)';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa !~ '^[D-KS-T]';
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE nazwa ~ '^[\w]+$';
/** ZAD 2 **/
SELECT idzamowienia, datarealizacji FROM zamowienia ORDER BY datarealizacji;
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2008-11-01' AND '2008-12-01';
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2008-11-12' AND '2008-11-20';
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2008-11-01' AND '2008-12-31';
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE (datarealizacji >= '2008-12-01' AND datarealizacji <= '2008-12-06') OR (datarealizacji >= '2008-12-06' AND datarealizacji <= '2008-12-24'); 
/** ZAD 3 **/
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 15 AND masa <= 35;
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 25 AND masa <= 35;
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.15 AND koszt <= 0.24;
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.25 AND koszt <= 0.35;
/** ZAD 4 **/
(SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 15 AND masa <= 35) UNION (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.15 AND koszt <= 0.24);
(SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 15 AND masa <= 35) INTERSECT (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.15 AND koszt <= 0.24);
(SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 25 AND masa <= 35) EXCEPT (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.25 AND koszt <= 0.35);
((SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 15 AND masa <= 24) INTERSECT (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.15 AND koszt <= 0.24)) UNION ((SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 25 AND masa <= 35) INTERSECT (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt >= 0.25 AND koszt <= 0.35));
(SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa >= 25 AND masa <= 35) EXCEPT (SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE (koszt >= 0.15 AND koszt <= 0.24) OR (koszt >= 0.25 AND koszt <= 0.35));
/** ZAD 5 **/
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajorzechow IS NOT NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajorzechow IS NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajnadzienia IS NOT NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajnadzienia IS NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajorzechow IS NOT NULL OR rodzajnadzienia IS NOT NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajorzechow IS NULL AND rodzajnadzienia IS NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajorzechow IS NULL OR rodzajnadzienia IS NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajczekolady IN ('Mleczna', 'Biala') AND rodzajorzechow IS NULL;
SELECT idczekoladki, nazwa, rodzajczekolady, rodzajorzechow, rodzajnadzienia FROM czekoladki WHERE rodzajczekolady NOT IN ('Mleczna', 'Biala') AND (rodzajorzechow IS NOT NULL OR rodzajnadzienia IS NOT NULL);
/** ZAD 6 **/
SELECT * FROM klienci WHERE telefon ~ '^[\d]{3} [\d]{3} [\d]{2} [\d]{2}$';
SELECT * FROM klienci WHERE telefon ~ '^[\d]{3} [\d]{3} [\d]{3}$';
/** ZAD 7 **/
echo '<html>' `psql -c "SELECT * FROM klienci;" -H` '</html>' > wynik.html
/** ZAD 8 **/

/** ZAD 9 **/
SELECT * FROM zamowienia;
SELECT * from pudelka;
