CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY IDENTITY (1,1),
	nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE prodotto(
	id_prodotto INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(100) NOT NULL,
	prezzo DECIMAL(10,2) NOT NULL,
	id_categoria INT NOT NULL,
	FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY IDENTITY(1,1),
	nome_cliente VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	telefono VARCHAR(20),
	data_registrazione DATE DEFAULT GETDATE()
);

CREATE TABLE ordine(
	id_ordine INT PRIMARY KEY IDENTITY(1,1),
	id_cliente INT NOT NULL,
	data_ordine DATE NOT NULL DEFAULT GETDATE(),
	stato VARCHAR(50) NOT NULL DEFAULT 'in elaborazione',
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pagamento(
	id_pagamento INT PRIMARY KEY IDENTITY(1,1),
	id_ordine INT NOT NULL,
	metodo VARCHAR(50) NOT NULL,
	importo DECIMAL(10,2) NOT NULL,
	data_pagamento DATE NOT NULL DEFAULT GETDATE(),
	FOREIGN KEY (id_ordine) REFERENCES ordine(id_ordine)
);

CREATE TABLE dettaglio_ordine(
	id_dettaglio INT PRIMARY KEY IDENTITY(1,1),
	id_ordine INT NOT NULL,
	id_prodotto INT NOT NULL,
	quantita INT NOT NULL,
	prezzo_unitario DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (id_ordine) REFERENCES ordine(id_ordine),
	FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto)
);

/*

INSERIMENTO DATI REALISTICI
*/
INSERT INTO categoria (nome_categoria)
VALUES 
	('Alimentari'), 
	('Elettronica'), 
	('Casa'), 
	('Sport');

INSERT INTO prodotto (nome, prezzo, id_categoria)
VALUES
	('Cereali', 15.50, 1),
	('Biscotti', 5.30, 1),
	('Latte', 10.00, 1),
	('Mouse Wireless', 25.90, 2),
	('Lampada LED', 28.40, 3),
	('Pallone da calcio', 22.00, 4);

INSERT INTO cliente (nome_cliente, email, telefono)
VALUES
	('Marco Rossi', 'marco.rossi@email.com', '3331112222'),
	('Luca Bianchi', 'luca.bianchi@email.com','3334445555'),
	('Giulia Verdi', 'giulia.verdi@email.com','3336667777');

INSERT INTO ordine (id_cliente, stato)
VALUES
	(1, 'completato'),
	(2, 'completato'),
	(3, 'in elaborazione');

INSERT INTO pagamento (id_ordine, metodo, importo)
VALUES
	(1, 'Carta di credito', 36.80),
	(2, 'PayPal', 50.00);

INSERT INTO dettaglio_ordine (id_ordine, id_prodotto, quantita, prezzo_unitario)
VALUES
	(1, 1, 2, 15.50),
	(1, 2, 1, 5.30),
	(2, 3, 5, 10.00),
	(3, 1, 1, 15.50);