SELECT Nome_Prodotto
FROM Videogiochi_e_software.Categoria INNER JOIN (
    SELECT Nome_Categoria, Nome_prodotto
    FROM Videogiochi_e_software.Tipologia AS Tipo INNER JOIN Videogiochi_e_software.Prodotto AS Prod ON Tipo.Nome_prodotto = Prod.Nome AND Tipo.Anno = Prod.Anno
    WHERE Prod.Gioco IS NOT NULL ) AS Giochi ON Nome = Nome_Categoria
WHERE Nome='Sport';