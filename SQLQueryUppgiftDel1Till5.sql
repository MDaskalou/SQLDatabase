-- 1. H�mta alla kunder fr�n Stockholm eller G�teborg, sorterade i stigande ordning efter namn.
SELECT *
FROM Kunder
WHERE Stad IN ('Stockholm', 'G�teborg')
ORDER BY Namn ASC;

-- 2. Hitta alla produkter som kostar mellan 100 och 500 SEK.
SELECT *
FROM Produkter
WHERE Pris BETWEEN 100 AND 500;

-- 3. H�mta alla ordrar med deras kundnamn och produktnamn genom att anv�nda JOIN.
SELECT Ordrar.OrderID, Kunder.Namn AS KundNamn, Produkter.Produktnamn AS ProduktNamn
FROM Ordrar
JOIN Kunder ON Ordrar.KundID = Kunder.KundID
JOIN Produkter ON Ordrar.ProduktID = Produkter.ProduktID;

-- 4. R�kna hur m�nga ordrar varje kund har gjort och visa endast de kunder med fler �n 2 ordrar.
SELECT Kunder.Namn, COUNT(Ordrar.OrderID) AS AntalOrdrar
FROM Kunder
JOIN Ordrar ON Kunder.KundID = Ordrar.KundID
GROUP BY Kunder.Namn
HAVING COUNT(Ordrar.OrderID) > 2;

-- 5. Visa de 5 dyraste produkterna.
SELECT TOP 5*
FROM Produkter
ORDER BY Pris DESC;