SELECT Des.Nome AS Nome, Des.Cognome AS Cognome, Des.Nazionalita AS Nazionalita
FROM Videogiochi_e_software.Designer AS Des INNER JOIN (
	SELECT id_designer
    FROM Videogiochi_e_software.Progettazione NATURAL JOIN Videogiochi_e_software.Prodotto
    WHERE Nome="Cuphead" AND Anno=2018) AS Id ON Des.Id = Id.Id_designer;