SELECT Prod.Nome AS Nome, Prod.Prezzo AS Prezzo
FROM Videogiochi_e_software.Prodotto AS Prod INNER JOIN Videogiochi_e_software.Compagnia AS Comp ON Prod.Produttore = Comp.Nome
WHERE Prod.Gioco IS FALSE AND Comp.Nome='Microsoft'
ORDER BY Prod.Prezzo;