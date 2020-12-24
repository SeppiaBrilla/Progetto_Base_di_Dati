SELECT Giochi.Nome AS Nome, Giochi.Anno AS Anno, Giochi.Valutazione AS Valutazione
FROM Videogiochi_e_software.Riproducibilita AS Rip INNER JOIN Videogiochi_e_software.ProdRecen AS Giochi ON Rip.Nome_Gioco = Giochi.Nome AND Rip.Anno = Giochi.Anno
WHERE Giochi.Gioco = 1 AND Rip.Nome_Console = "Playstation 4"
ORDER BY Giochi.Valutazione;