SELECT Nome, Anno, Prezzo Descrizione, Produttore, Sviluppatore, Saga, Valutazione 
FROM Videogiochi_e_software.ProdRecen
WHERE Gioco = 1
ORDER BY Valutazione DESC;