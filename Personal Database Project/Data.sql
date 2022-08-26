

CREATE TABLE Studio (
	Studio_Name varchar(50) PRIMARY KEY NOT NULL,
	Studio_Address varchar(50) NOT NULL,
	Studio_Phone varchar(50) NOT NULL
);

INSERT INTO Studio (Studio_Name, Studio_Address, Studio_Phone)
VALUES ('Universal', '1 California', '303-124-4567'),
('WB', '2 California', '720-890-4567')
;
select * from Studio;

CREATE TABLE DVDs (
	DVD_DVDID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	DVD_DVDTitle varchar(50) NOT NULL,
	DVDs_DVDStudio varchar(50) NOT NULL CONSTRAINT fk_DVDs_publisher FOREIGN KEY REFERENCES Studio(Studio_Name) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO DVDs (DVD_DVDTitle, DVDs_DVDStudio)
VALUES ('Pet Sematary','Universal'),
('ET','WB'),
('Django', 'Universal'),
('Wolf On Wall Street', 'WB'),
('Inception', 'WB'), ('Fight Club', 'WB'),
('Avatar', 'Universal'), ('BettleJuice', 'Universal'),
('Harry Potter', 'WB'), ('Eragon', 'Universal'),
('Blackklanman', 'Universal'), ('Prometheus', 'Universal'),
('Gran Torino', 'WB'), ('Star Wars', 'WB'),
('Tranformers', 'Universal'), ('Pacific Rim', 'Universal'),
('The Great Gatsby', 'Universal'), ('Star Trek', 'WB'),
('From Dusk till Dawn', 'Universal'), ('It', 'Universal')
;
select * from DVDs;

CREATE TABLE Director (
	Director_DVDID INT NOT NULL CONSTRAINT fk_Director_DVDID FOREIGN KEY REFERENCES DVDs(DVD_DVDID) ON UPDATE CASCADE ON DELETE CASCADE,
	Director_Name varchar(50) NOT NULL
);

INSERT INTO Director (Director_DVDID, Director_Name)
VALUES (1, 'Stephen King'),(2,'Steven Spielberg'), (3,'Quentin Tarantino'), (4, 'Martin Scorsese'),
(5,'Christopher Nolan'), (6, 'David Fincher'), (7, 'James Cameron'), (8, 'Tim Burton'),
(9, 'J.K. Rowling'), (10, 'Christopher Paolini'), (11, 'Spike lee'), (12, 'Ridley Scott'),
(13, 'Clint Eastwood'), (14, 'George Lucas'), (15, 'Micheal Bay'), (16, 'Guillermo Del Torro'),
(17, 'Baz Luhrmann'), (18, 'J.J. Abrams'), (19, 'Robert Rodriguez'), (20, 'Stephen King')
;
select * from Director;

CREATE TABLE copies (
	copies_DVDID INT NOT NULL CONSTRAINT fk_copies_DVDID FOREIGN KEY REFERENCES DVDs(DVD_DVDID) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_BranchID INT NOT NULL CONSTRAINT fk_copies_BranchID FOREIGN KEY REFERENCES Blockbuster_branch(Blockbuster_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_NumberofCopies INT NOT NULL
);

INSERT INTO copies (copies_DVDID, copies_BranchID, copies_NumberofCopies)
VALUES (1, 1, 2),(19, 1, 3),(2, 1, 2), (3, 1, 5), (4, 1, 2), (15, 1, 2), (7, 1, 2), (10, 1, 5), (12, 1, 2), (5, 1, 3),
(14, 2, 2), (20, 2, 5), (1, 2, 5), (6, 2, 2), (8, 2, 2), (9, 2, 3), (11, 2, 4), (13, 2, 2), (2, 2, 2), (18, 2, 4),
(20, 3, 2), (19, 3, 2), (18, 3, 2), (17, 3, 2), (16, 3, 2), (15, 3, 2), (14, 3, 2), (13, 3, 2), (12, 3, 2), (11, 3, 2),
(10, 4, 2), (9, 4, 2), (8, 4, 2), (7, 4, 2), (6, 4, 2), (5, 4, 2), (4, 4, 2), (3, 4, 2), (2, 4, 2), (1, 4, 2)
;
SELECT * FROM copies;

CREATE TABLE Renters (
	Renters_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Renters_Name varchar(50) NOT NULL,
	Renters_Address varchar(50) NOT NULL,
	Renters_Phone varchar(50) NOT NULL
);

INSERT INTO Renters (Renters_Name, Renters_Address, Renters_Phone)
VALUES ('Tim Allison', 'Littleton', '720-579-6647'),
('Amanda Espinoza', 'Westminster', '3786-403-4567'),
('Zach Englemen', 'Lakewood', '303-880-4204'),
('Rocco Delorenzo', 'Thornton', '716-653-4567'),
('Van chong', 'Arvada', '313-732-6653')
;