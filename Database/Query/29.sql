SELECT Con.Nome AS Console
FROM Videogiochi_e_software.Compagnia AS C INNER JOIN Videogiochi_e_software.Console AS Con ON C.Nome = Con.Compagnia
WHERE C.Nome = "Nintendo";