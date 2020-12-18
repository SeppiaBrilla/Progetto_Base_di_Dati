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
    Prezzo decimal(3,2) unsigned,
    Descrizione char(140),
    Produttore char(20) not null references Compagnia(Nome),
    Sviluppatore char(20) not null references Compagnia(Nome),
    Gioco int references Gioco(Id),
    PRIMARY KEY(Nome, Anno)
);
CREATE TABLE Gioco(
	Id integer auto_increment not null primary key,
    Saga char(30) references Saga(Nome)
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
    Compagnia char(20) not null references Compagnia(Nome)
);
CREATE TABLE Console(
	Nome char(20) not null primary key,
    Data_Uscita date,
    Supporto bool,
    Compagnia char(20) not null references Compagnia(Nome),
    Generazione integer not null references Generazione(Numero)
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
    Id_gioco integer not null references Gioco(Id),
    PRIMARY KEY(Id_designer, Id_gioco)
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
	Id char(20) not null references Gioco(Id),
    Nome char(20) not null references Console(Nome),
    PRIMARY KEY(Id, Nome)
);