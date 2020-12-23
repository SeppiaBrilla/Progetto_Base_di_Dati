SELECT DISTINCT Prod.Sviluppatore AS Sviluppatori
FROM Videogiochi_e_software.Compagnia AS Comp INNER JOIN Videogiochi_e_software.Prodotto AS Prod ON Comp.Nome = Prod.Produttore
WHERE Comp.Nome = 'Microsoft' AND Prod.Gioco IS NOT NULL;