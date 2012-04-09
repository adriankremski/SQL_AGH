/** ZAD 1 **/

SELECT COUNT(*) FROM czekoladki;

SELECT COUNT(*) FROM czekoladki WHERE rodzajnadzienia IS NOT NULL;

SELECT COUNT(rodzajnadzienia) FROM czekoladki WHERE rodzajnadzienia IS NOT NULL;

SELECT idpudelka, SUM(sztuk) FROM zawartosc GROUP BY idpudelka;

SELECT z.idpudelka, SUM(z.sztuk) FROM zawartosc z, czekoladki c WHERE z.idczekoladki = c.idczekoladki AND c.rodzajorzechow IS NULL GROUP BY z.idpudelka;

SELECT z.idpudelka, SUM(z.sztuk) FROM zawartosc z, czekoladki c WHERE z.idczekoladki = c.idczekoladki AND c.rodzajczekolady ~ 'Mleczna' GROUP BY z.idpudelka;

SELECT idpudelka, MAX(sztuk) FROM zawartosc GROUP BY idpudelka;

SELECT
  zsumowane.pudelko, MAX(zsumowane.calosc) as ilosc_czekoladek
FROM 
    (
      SELECT SUM(sztuk) as calosc, idpudelka as pudelko
      FROM zawartosc 
      GROUP BY idpudelka
    ) zsumowane
GROUP BY zsumowane.pudelko
ORDER BY 2 DESC LIMIT 1;

/** ZAD 2 **/

SELECT 
  z.idpudelka, (SELECT SUM(masa) as masa_czekoladek FROM czekoladki WHERE z.idczekoladki = idczekoladki) as masa_czekoladek
FROM 
  zawartosc z 
GROUP BY 
  z.idpudelka, z.idczekoladki;
