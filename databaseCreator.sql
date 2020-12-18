CREATE DATABASE Videogiochi_e_software;
USE Videogiochi_e_software;
CREATE TABLE Categoria(
	Nome char(20) not null primary key,
    derivazione char(20)
);
CREATE TABLE Utente(
	Nickname char(20) not null primary key
);
CREATE TABLE Prodotto(
	Nome char(30),
    Anno year,
    Prezzo decimal(3,2) unsigned,
    Descrizione char(140),
    Produttore char(20),
    Sviluppatore char(20),
    Gioco int,
    PRIMARY KEY(Nome, Anno)
);
CREATE TABLE Gioco(
	Id integer auto_increment not null primary key,
    Saga char(30)
);
CREATE TABLE Designer(
	Id integer auto_increment not null primary key,
    Nome char(20),
    Cognome char(20),
    Nazionalita char(20)
);
CREATE TABLE Compagnia(
	Nome char(20) not null primary key,
    Fondazione date,
    Nazionalita char(20)
);
CREATE TABLE Store_PC(
	Nome char(20) not null primary key,
    Compagnia char(20)
);
CREATE TABLE Console(
	Nome char(20) not null primary key,
    Data_Uscita date,
    Supporto bool,
    Compagnia char(20),
    Generazione integer
);
CREATE TABLE Saga(
	Nome char(30) not null primary key,
    Descrizione char(140),
    Stato char(20), 
    check(Stato = "Terminata" or Stato = "In corso")
);
CREATE TABLE Generazione(
	Numero integer not null primary key,
    Stato char(20)
);
CREATE TABLE Tipologia(
	Nome_prodotto char(30),
    Anno year,
    Nome_Categoria char(20),
    PRIMARY KEY(Nome_prodotto, Anno, Nome_Categoria)
);
CREATE TABLE Recensione(
	Nome char(30),
    Anno year,
    Nickname char(20),
    voto tinyint,
    PRIMARY KEY(Nome, Anno, Nickname),
    check(voto > 0 and voto < 6)
);
CREATE TABLE Progettazione(
	Id_designer integer,
    Id_gioco integer,
    PRIMARY KEY(Id_designer, Id_gioco)
);
CREATE TABLE Disponibilita(
	Nome_prodotto char(30),
    Anno year,
    Nome_store char(20),
    Processore char(20),
    Scheda_Grafica char(20),
    Os char(20),
    PRIMARY KEY(Nome_prodotto, Anno, Nome_store)
);
CREATE TABLE Riproducibilita(
	Id char(20),
    Nome char(20),
    PRIMARY KEY(Id, Nome)
);
