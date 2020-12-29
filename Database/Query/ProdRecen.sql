USE my2004;
CREATE VIEW ProdRecen AS
SELECT P.Nome AS Nome, P.Anno AS Anno, P.Prezzo AS Prezzo, P.Descrizione AS Descrizione, P.Produttore AS Produttore, P.Sviluppatore AS Sviluppatore, P.Gioco AS Gioco, P.Saga AS Saga, AVG(R.Voto) AS Valutazione
FROM Prodotto AS P LEFT JOIN Recensione AS R ON P.Nome = R.Nome AND P.Anno = R.Anno
GROUP BY P.Nome, P.Anno, P.Prezzo, P.Descrizione, P.Produttore, P.Sviluppatore, P.Gioco, P.Saga;