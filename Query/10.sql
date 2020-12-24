INSERT INTO `Videogiochi_e_software`.`Saga` (`Nome`, `Descrizione`, `Stato`) VALUES ('Super Mario', 'Picchi gli ddei', 'In Corso');
UPDATE `Videogiochi_e_software`.`Prodotto` SET `Saga` = 'Super Mario' WHERE (`Nome` = 'Super Mario Odissey') and (`Anno` = 2018);
