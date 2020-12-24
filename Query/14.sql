SELECT Nome_Prodotto AS Nome, Anno, Valutazione
FROM Videogiochi_e_software.Categoria AS Cat NATURAL JOIN (
    SELECT Tipo.Nome_Categoria AS Nome, Prod.Nome AS Nome_prodotto, Prod.Anno AS ANNO, Prod.Valutazione AS Valutazione
    FROM Videogiochi_e_software.Tipologia AS Tipo INNER JOIN Videogiochi_e_software.ProdRecen AS Prod ON Tipo.Nome_prodotto = Prod.Nome AND Tipo.Anno = Prod.Anno
    WHERE Prod.Gioco = 1) AS Giochi
WHERE Nome='Sport';