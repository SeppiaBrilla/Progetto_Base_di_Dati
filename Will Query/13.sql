SELECT Nome, Anno, AVG(Voto)
FROM Videogiochi_e_software.Prodotto NATURAL JOIN Videogiochi_e_software.Recensione
WHERE Gioco IS NOT NULL
GROUP BY Nome, Anno;