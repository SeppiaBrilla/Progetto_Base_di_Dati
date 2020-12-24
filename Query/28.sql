SELECT S.Nome AS Store
FROM Videogiochi_e_software.Compagnia AS C INNER JOIN Videogiochi_e_software.Store_PC AS S ON C.Nome = S.Compagnia
WHERE C.Nome = "Microsoft";