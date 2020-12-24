SELECT Generazione, MIN(Data_Uscita) AS Inizio
FROM Videogiochi_e_software.Console
WHERE Supporto IS TRUE
GROUP BY Generazione;