CREATE DATABASE Videogiochi_e_software;
USE Videogiochi_e_software;
CREATE TABLE Categoria(
	Nome char(20) not null primary key,
    derivazione char(20),
    foreign key (derivazione) references Categoria(Nome)
);
CREATE TABLE Utente(
	Nickname char(20) not null primary key
);
CREATE TABLE Compagnia(
	Nome char(20) not null primary key,
    Fondazione year,
    Nazionalita char(20)
);
CREATE TABLE Saga(
	Nome char(30) not null primary key,
    Descrizione char(140),
    Stato char(20), 
    check(Stato = "Terminata" or Stato = "In corso")
);
CREATE TABLE Prodotto(
	Nome char(30) not null,
    Anno year not null,
    Prezzo decimal(5,2) unsigned,
    Descrizione char(140),
    Produttore char(20) not null,
    Sviluppatore char(20) not null,
    Gioco boolean,
    Saga char(30),
    PRIMARY KEY(Nome, Anno),
    check((Saga IS NOT NULL AND Gioco = True) OR (Saga IS NUll)),
    foreign key (Produttore) references Compagnia(Nome),
    foreign key (Sviluppatore) references Compagnia(Nome),
    foreign key (Saga) references Saga(Nome)    
);
CREATE TABLE Designer(
	Id integer auto_increment not null primary key,
    Nome char(20),
    Cognome char(20),
    Nazionalita char(20)
);
CREATE TABLE Store_PC(
	Nome char(20) not null primary key,
    Compagnia char(20) not null,
    foreign key (Compagnia) references Compagnia(Nome)
);
CREATE TABLE Console(
	Nome char(20) not null primary key,
    Data_Uscita date,
    Supporto bool,
    Compagnia char(20) not null,
    Generazione integer not null,
    foreign key (Compagnia) references Compagnia(Nome)
);
CREATE TABLE Tipologia(
	Nome_prodotto char(30) not null,
    Anno year not null,
    Nome_Categoria char(20) not null,
    PRIMARY KEY(Nome_prodotto, Anno, Nome_Categoria),
	foreign key (Nome_prodotto, Anno) references Prodotto(Nome, Anno),
    foreign key (Nome_Categoria) references Categoria(Nome)
);
CREATE TABLE Recensione(
	Nome char(30) not null,
    Anno year not null,
    Utente char(20) not null,
    Voto tinyint,
    PRIMARY KEY(Nome, Anno, Utente),
    check(voto > 0 and voto < 6),
	foreign key (Nome, Anno) references Prodotto(Nome, Anno),
    foreign key (Utente) references Utente(Nickname)
);
CREATE TABLE Progettazione(
	Id_designer integer not null,
    Nome char(30) not null,
    Anno year not null,
    PRIMARY KEY(Id_designer, Nome, Anno),
	foreign key (Id_designer) references Designer(Id),
    foreign key (Nome, Anno) references Prodotto(Nome, Anno)
);
CREATE TABLE Disponibilita(
	Nome_prodotto char(30) not null,
    Anno year not null,
    Nome_store char(20) not null,
    Processore char(20),
    Scheda_Grafica char(20),
    Os char(20),
    PRIMARY KEY(Nome_prodotto, Anno, Nome_store),
	foreign key (Nome_prodotto, Anno) references Prodotto(Nome, Anno),
    foreign key (Nome_store) references Store_PC(Nome)
);
CREATE TABLE Riproducibilita(
	Nome_Gioco char(30) not null,
    Anno year not null,
    Nome_Console char(20) not null,
    PRIMARY KEY(Nome_Gioco, Anno, Nome_Console),
	foreign key (Nome_Gioco, Anno) references Prodotto(Nome, Anno),
    foreign key (Nome_Console) references Console(Nome)
);
