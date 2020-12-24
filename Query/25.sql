SELECT P.Nome AS Nome, P.Anno AS Anno, P.Prezzo AS Prezzo, P.Descrizione AS Descrizione, P.Valutazione as Valutazione
FROM Videogiochi_e_software.ProdRecen AS P INNER JOIN Videogiochi_e_software.Saga AS S ON P.Saga = S.Nome
WHERE S.Nome="The Legend Of Zelda" AND P.Gioco IS TRUE;