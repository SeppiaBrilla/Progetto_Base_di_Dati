CREATE DATABASE Videogiochi_e_software;
USE Videogiochi_e_software;
CREATE TABLE Categoria(
	Nome char(20) not null primary key,
    derivazione char(20) references categoria(Nome)
);
CREATE TABLE Utente(
	Nickname char(20) not null primary key
);
CREATE TABLE Prodotto(
	Nome char(30),
    Anno year,
    Prezzo decimal(5,2) unsigned,
    Descrizione char(140),
    Produttore char(20) not null references Compagnia(Nome),
    Sviluppatore char(20) not null references Compagnia(Nome),
    Gioco boolean,
    Saga char(30) references Saga(Nome),
    PRIMARY KEY(Nome, Anno),
    check((Saga IS NOT NULL AND Gioco = True) OR (Saga IS NUll))
);
CREATE TABLE Designer(
	Id integer auto_increment not null primary key,
    Nome char(20),
    Cognome char(20),
    Nazionalita char(20)
);
CREATE TABLE Compagnia(
	Nome char(20) not null primary key,
    Fondazione year,
    Nazionalita char(20)
);
CREATE TABLE Store_PC(
	Nome char(20) not null primary key,
    Compagnia char(20) not null references Compagnia(Nome)
);
CREATE TABLE Console(
	Nome char(20) not null primary key,
    Data_Uscita date,
    Supporto bool,
    Compagnia char(20) not null references Compagnia(Nome),
    Generazione integer not null
);
CREATE TABLE Saga(
	Nome char(30) not null primary key,
    Descrizione char(140),
    Stato char(20), 
    check(Stato = "Terminata" or Stato = "In corso")
);
CREATE TABLE Tipologia(
	Nome_prodotto char(30) not null references Prodotto(Nome),
    Anno year not null references Prodotto(Anno),
    Nome_Categoria char(20) not null references Categoria(Nome),
    PRIMARY KEY(Nome_prodotto, Anno, Nome_Categoria)
);
CREATE TABLE Recensione(
	Nome char(30) not null references Prodotto(Nome),
    Anno year not null references Prodotto(Anno),
    Utente char(20) not null references Utente(Nickname),
    Voto tinyint,
    PRIMARY KEY(Nome, Anno, Utente),
    check(voto > 0 and voto < 6)
);
CREATE TABLE Progettazione(
	Id_designer integer not null references Designer(Id),
    Nome char(30) not null references Prodotto(Nome),
    Anno year not null references Prodotto(Anno),
    PRIMARY KEY(Id_designer, Nome, Anno)
);
CREATE TABLE Disponibilita(
	Nome_prodotto char(30) not null references Prodotto(Nome),
    Anno year not null references Prodotto(Anno),
    Nome_store char(20) not null references Store_PC(Nome),
    Processore char(20),
    Scheda_Grafica char(20),
    Os char(20),
    PRIMARY KEY(Nome_prodotto, Anno, Nome_store)
);
CREATE TABLE Riproducibilita(
	Nome_Gioco char(30) not null references Prodotto(Nome),
    Anno year not null references Prodotto(Anno),
    Nome_Console char(20) not null references Console(Nome),
    PRIMARY KEY(Nome_Gioco, Anno, Nome_Console)
);
