SELECT Giochi.Nome AS Nome, Giochi.Anno AS Anno, Giochi.Valutazione AS Valutazione
FROM Videogiochi_e_software.Disponibilita AS Disp INNER JOIN Videogiochi_e_software.ProdRecen AS Giochi ON Disp.Nome_prodotto = Giochi.Nome AND Disp.Anno = Giochi.Anno
WHERE Giochi.Gioco = 1 AND Disp.Nome_Store= "Steam"
ORDER BY Giochi.Valutazione;