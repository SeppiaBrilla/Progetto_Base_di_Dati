SELECT DISTINCT Prod.Produttore AS Produttori
FROM Videogiochi_e_software.Compagnia AS Comp INNER JOIN Videogiochi_e_software.Prodotto AS Prod ON Comp.Nome = Prod.Produttore
WHERE Prod.Sviluppatore = 'Microsoft' AND Prod.Gioco IS TRUE;