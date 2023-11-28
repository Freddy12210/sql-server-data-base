USE TP5
GO

/*
--CREATE DATABASE Team_builder
--GO
USE TP5
GO

CREATE TABLE [equipe] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom] varchar(100) NOT NULL,
  [projet] varchar(100) NOT NULL,
  [personne_id] int
)
GO

CREATE TABLE [personne] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [prenom] varchar(100) NOT NULL,
  [nom] varchar(100) NOT NULL
)
GO

CREATE TABLE [equipe_has_personne] (
  [personne_id] int,
  [equipe_id] int,
  PRIMARY KEY ([personne_id], [equipe_id])
)
GO

ALTER TABLE [equipe] ADD FOREIGN KEY ([personne_id]) REFERENCES [personne] ([id])
GO

ALTER TABLE [equipe_has_personne] ADD FOREIGN KEY ([equipe_id]) REFERENCES [equipe] ([id])
GO

ALTER TABLE [equipe_has_personne] ADD FOREIGN KEY ([personne_id]) REFERENCES [personne] ([id])
GO
*/

/*
INSERT INTO personne(prenom, nom) VALUES
	('Brad', 'Pitt'),
	('Bruce', 'Willis'),
	('Nicolas', 'Cage'),
	('Angelina', 'Jolie'),
	('Tom', 'Cruise'),
	('Tom', 'Hanks'),
	('Bob', 'Dylan'),
	('Jhonny', 'Cadillac'),
	('Jimmy', 'Hendrix');


INSERT INTO equipe(nom, projet, personne_id) VALUES
	('Team A', 'Projet site internet Mairie', 1),
	('Team B', 'Projet CRM', 4),
	('Team C', 'Projet ERP', 7);


INSERT INTO equipe_has_personne(personne_id, equipe_id) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3);
*/

/* Afficher une équipe */

SELECT equipe.nom ,personne.prenom, personne.nom FROM equipe
JOIN equipe_has_personne ON equipe_has_personne.equipe_id = equipe.id
JOIN personne ON personne.id = equipe_has_personne.personne_id
WHERE equipe.nom = 'Team A'

/* Afficher toutes les équipes */

SELECT * FROM equipe