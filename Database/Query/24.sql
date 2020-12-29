SELECT S.Nome AS Nome, S.Descrizione AS Descrizione, S.Stato AS Stato, MIN(P.Anno) AS Nascita
FROM Videogiochi_e_software.Saga as S, Videogiochi_e_software.Prodotto AS P
WHERE P.Saga = S.Nome
GROUP BY S.Nome
ORDER BY MIN(P.Anno);