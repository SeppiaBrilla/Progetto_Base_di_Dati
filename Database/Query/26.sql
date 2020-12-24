SELECT DISTINCT C.Nome AS Compagnie
FROM Videogiochi_e_software.Compagnia AS C INNER JOIN Videogiochi_e_software.Prodotto AS P ON C.Nome = P.Produttore;