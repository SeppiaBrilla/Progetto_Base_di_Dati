 SELECT DISTINCT Compagnia.Nome AS Nome, Compagnia.Fondazione AS Fondazione, Compagnia.Nazionalita AS Nazionalita
	FROM Designer, Progettazione, 
    Prodotto, Compagnia
	WHERE Designer.Id = Progettazione.Id_designer AND Progettazione.Nome = Prodotto.Nome AND Progettazione.Anno = Prodotto.Anno AND Prodotto.Produttore = Compagnia.Nome AND Prodotto.Sviluppatore = Compagnia.Nome AND Designer.Id = 1;
    