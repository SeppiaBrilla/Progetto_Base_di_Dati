CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Videogiochi_e_software`.`ProdRecen` AS
    SELECT 
        `P`.`Nome` AS `Nome`,
        `P`.`Anno` AS `Anno`,
        `P`.`Prezzo` AS `Prezzo`,
        `P`.`Descrizione` AS `Descrizione`,
        `P`.`Produttore` AS `Produttore`,
        `P`.`Sviluppatore` AS `Sviluppatore`,
        `P`.`Gioco` AS `Gioco`,
        `P`.`Saga` AS `Saga`,
        AVG(`R`.`Voto`) AS `Valutazione`
    FROM
        (`Videogiochi_e_software`.`Prodotto` `P`
        LEFT JOIN `Videogiochi_e_software`.`Recensione` `R` ON (((`P`.`Nome` = `R`.`Nome`)
            AND (`P`.`Anno` = `R`.`Anno`))))
    GROUP BY `P`.`Nome` , `P`.`Anno` , `P`.`Prezzo` , `P`.`Descrizione` , `P`.`Produttore` , `P`.`Sviluppatore` , `P`.`Gioco` , `P`.`Saga`