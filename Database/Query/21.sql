SELECT Nome, Anno, Prezzo Descrizione, Produttore, Sviluppatore, Saga, Valutazione 
FROM Videogiochi_e_software.ProdRecen
WHERE Gioco IS TRUE
ORDER BY Valutazione DESC;