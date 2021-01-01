WITH RECURSIVE Principale(Derivato, Derivante) AS 
(	SELECT *
	FROM Videogiochi_e_software.Categoria
    UNION ALL
    SELECT Nome, Derivante
    FROM Principale, Videogiochi_e_software.Categoria
    WHERE Derivato = derivazione
)
SELECT Derivato as Categorie
FROM Principale
WHERE Derivante = "RPG";