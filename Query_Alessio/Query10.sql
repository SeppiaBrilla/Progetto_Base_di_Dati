 SELECT DISTINCT Compagnia.Nome AS Nome, Compagnia.Fondazione AS Fondazione, Compagnia.Nazionalita AS Nazionalita
	FROM Designer, Progettazione,
    Prodotto, Compagnia
	WHERE Designer.Id = Progettazione.Id_designer AND Progettazione.Id_gioco = Prodotto.Gioco AND Prodotto.Produttore = Compagnia.Nome AND Prodotto.Sviluppatore = Compagnia.Nome AND Designer.Id = 1
    