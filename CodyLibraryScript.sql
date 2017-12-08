USE MASTER;
if (select count(*) 
    from sys.databases where name = 'LibraryDB') > 0
BEGIN
    DROP DATABASE LibraryDB;
END

CREATE DATABASE LibraryDB;
GO

USE LibraryDB

CREATE TABLE Publications
(
	PubID INT NOT NULL IDENTITY(1,1),
	BookTitle Varchar(100) NOT Null,
	MagTitle Varchar(100) NOT Null,
	MediaTitle Varchar(100) NOT NULL,

	PRIMARY KEY (PubID),
)
CREATE TABLE Pub_Lost
(
	LostID INT NOT NULL IDENTITY(1,1),
	PubID INT NOT NULL,
	DateLoss DATE NOT NULL,
	PubRemoved INT NOT NULL,

	PRIMARY KEY (LostID),
	CONSTRAINT fk_Pub_Lost_Publications FOREIGN KEY (PubID) REFERENCES Publications(PubID)
)
CREATE TABLE Members
(
	MemID INT NOT NULL IDENTITY(1,1),
	[First] varchar(30) NOT NULL,
	[Last] varchar (30) NOT NULL,
	Birthdate DATE NOT NULL,
	Phone varchar(20) NULL,
	Email varchar(100) NULL,
	MemStart DATE NOT NULL,
	Active varchar(3) NOT NULL,
	LibCardNum varchar(10) NOT NULL,

	PRIMARY KEY (MemID)
)
CREATE TABLE Pub_In_Circ
(
	PubCircID INT NOT NULL Identity(1,1),
	MemID INT NOT NULL,
	PubID INT NOT NULL,
	Checkin DATE NULL,
	Checkout DATE NOT NULL,
	DueDate DATE NOT NULL,
	Daypastdue INT NULL,

	PRIMARY KEY (PubCircID),

	CONSTRAINT fk_Pub_In_Circ_Members FOREIGN KEY (MemID) REFERENCES Members(MemID),
	CONSTRAINT fk_Pub_In_Circ_Publications FOREIGN KEY (PubID) REFERENCES Publications(PubID)
)
CREATE TABLE Employees
(	
	EmpID INT NOT NULL IDENTITY(1,1),
	Em_First varchar(30) NOT NULL,
	Em_Last varchar(30) NOT NULL,
	Address varchar(60) NOT NULL,
	Email varchar(60) NULL,
	Phone varchar(14) NULL,
	JobTitle varchar(20) NOT NULL,
	PayRate	MONEY NOT NULL,
	HiredDate DATE NOT NULL,
	ReleasedDate DATE NULL,
	Employed INT NOT NULL,

	PRIMARY KEY (EmpID)
)
CREATE TABLE Fees
(
	FeeID INT NOT NULL IDENTITY(1,1),
	MemID INT NOT NULL,
	FeeAmt MONEY NOT NULL,
	FeePaid INT NOT NULL,
	PaidDate DATE NULL,
	PaidTo INT NOT NULL,

	PRIMARY KEY (FeeID),
	
	CONSTRAINT  fk_Fees_Members FOREIGN KEY (MemID) REFERENCES Members(MemID)
)
CREATE TABLE Location
(
	LocationID INT NOT NULL IDENTITY(1,1),
	ShelfRow INT NOT NULL,
	FloorIsle INT NOT NULL,
	
	PRIMARY KEY (LocationID)
)
CREATE TABLE Genre
(	
	GenreID INT NOT NULL IDENTITY(1,1),
	GenreDetails varchar(100) NOT NULL,

	PRIMARY KEY (GenreID)
)

CREATE TABLE Books
(
	BookID INT NOT NULL IDENTITY(1,1),
	ISBN varchar(40) NOT NULL,
	BookTitle varchar(100) NOT NULL,
	PubID INT NOT NULL,
	LocationID INT NOT NULL,
	GenreID INT NOT NULL,
	Author varchar(100) NOT NULL,
	BookPub varchar(60) NULL,
	Published DATE NOT NULL,
	Price MONEY NOT NULL,
	Available INT NOT NULL,

	PRIMARY KEY (BookID),
	CONSTRAINT fk_Books_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
	CONSTRAINT fk_Books_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
	CONSTRAINT fk_Books_Publishers FOREIGN KEY (PubID) REFERENCES Publications(PubID)
)
CREATE TABLE Magazines
(
	MagID INT NOT NULL IDENTITY (1,1),
	MagTitle varchar(100) NOT NULL,
	MagPub varchar(60) NULL,
	GenreID INT NOT NULL,
	LocationID INT NOT NULL,
	MagPubdate DATE NOT NULL,
	Price Money NOT NULL,
	Available INT NOT NULL,

	PRIMARY KEY (MagID),
	CONSTRAINT fk_Magazines_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
	CONSTRAINT fk_Magazines_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)
CREATE TABLE Media
(
	MediaID INT NOT NULL IDENTITY(1,1),
	MedProd varchar(60) NOT NULL,
	MediaTitle varchar(100) NOT NULL,
	LocationID INT NOT NULL,
	GenreID INT NOT NULL,
	Director varchar(100) Null,
	Price Money NOT NULL,
	Available INT NOT NULL,

	PRIMARY KEY (MediaID),
	CONSTRAINT fk_Media_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
	CONSTRAINT fk_Media_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)


insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Berkie', 'Cussons', '08/12/1943', '942-346-6666', 'bcussons0@linkedin.com', '9/7/2016', 0, 2305429762);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Sibylla', 'Edelmann', '03/16/1985', '625-568-3859', 'sedelmann1@plala.or.jp', '3/4/2017', 1, 2591988013);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Melisa', 'Say', '03/01/1945', '714-789-4287', 'msay2@techcrunch.com', '10/8/2017', 1, 2278120847);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Bartholomeo', 'Stroobant', '12/30/1957', '466-385-4221', 'bstroobant3@fc2.com', '1/22/2017', 0, 3233431360);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Elnar', 'Baltrushaitis', '06/30/1944', '310-959-6616', 'ebaltrushaitis4@privacy.gov.au', '2/15/2017', 1, 3910808899);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Wadsworth', 'Brydie', '01/04/1972', '503-148-9268', 'wbrydie5@nifty.com', '3/28/2016', 1, 2589723885);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Marquita', 'Rutgers', '09/04/1954', '459-672-6900', 'mrutgers6@hp.com', '12/15/2016', 1, 5243230601);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Ty', 'Bernardo', '06/23/1989', '645-631-5194', 'tbernardo7@slideshare.net', '2/27/2016', 0, 7075743469);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Edyth', 'Conrad', '03/08/1961', '107-394-1319', 'econrad8@hubpages.com', '10/29/2017', 1, 5961397886);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Eadith', 'Trattles', '01/01/1989', '549-782-9337', 'etrattles9@timesonline.co.uk', '1/4/2017', 1, 4869090244);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Michel', 'Blasdale', '09/30/1942', '607-825-8061', 'mblasdalea@smugmug.com', '3/18/2016', 1, 3849297790);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Trix', 'Twiggins', '01/02/1941', '641-909-6764', 'ttwigginsb@ibm.com', '1/20/2017', 1, 2262123188);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Mag', 'Loomes', '06/28/1975', '608-167-4014', 'mloomesc@wikispaces.com', '9/1/2017', 0, 6230861404);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Hazlett', 'Davys', '08/18/1986', '714-306-0056', 'hdavysd@bravesites.com', '8/25/2016', 1, 5893762562);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Maggie', 'Tierny', '10/21/1986', '416-653-1346', 'mtiernye@unc.edu', '9/16/2017', 1, 5469266853);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Willi', 'Nesbitt', '11/24/1984', '437-972-5625', 'wnesbittf@dyndns.org', '2/14/2016', 0, 3660147485);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Lanna', 'Alen', '08/13/1983', '490-654-5318', 'laleng@last.fm', '12/24/2016', 0, 1382674112);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Aggy', 'Teers', '11/05/1977', '644-200-0832', 'ateersh@livejournal.com', '2/11/2017', 0, 6927971848);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Pasquale', 'Dallin', '06/27/1954', '275-625-5524', 'pdallini@sakura.ne.jp', '9/13/2016', 1, 8371091633);
insert into Members ( First, Last, Birthdate, Phone, Email, MemStart, Active, LibCardNum) values ( 'Lynne', 'Marians', '11/23/1984', '614-493-0454', 'lmariansj@about.me', '5/14/2016', 0, 3899591191);

Insert into Genre ([GenreDetails]) Values ('Science fiction');
Insert into Genre ([GenreDetails]) Values ('Satire');
Insert into Genre ([GenreDetails]) Values ('Drama');
Insert into Genre ([GenreDetails]) Values ('Action and Adventure');
Insert into Genre ([GenreDetails]) Values ('Romance');
Insert into Genre ([GenreDetails]) Values ('Mystery');
Insert into Genre ([GenreDetails]) Values ('Horror');
Insert into Genre ([GenreDetails]) Values ('Self help');
Insert into Genre ([GenreDetails]) Values ('Health');
Insert into Genre ([GenreDetails]) Values ('Guide');
Insert into Genre ([GenreDetails]) Values ('Travel');
Insert into Genre ([GenreDetails]) Values ('Childrens');
Insert into Genre ([GenreDetails]) Values ('Religion, Spirituality & New Age');
Insert into Genre ([GenreDetails]) Values ('Science');
Insert into Genre ([GenreDetails]) Values ('History');
Insert into Genre ([GenreDetails]) Values ('Math');
Insert into Genre ([GenreDetails]) Values ('Anthology');
Insert into Genre ([GenreDetails]) Values ('Poetry');
Insert into Genre ([GenreDetails]) Values ('Encyclopedias');
Insert into Genre ([GenreDetails]) Values ('Dictionaries');
Insert into Genre ([GenreDetails]) Values ('Comics');
Insert into Genre ([GenreDetails]) Values ('Art');
Insert into Genre ([GenreDetails]) Values ('Cookbooks');
Insert into Genre ([GenreDetails]) Values ('Diaries');
Insert into Genre ([GenreDetails]) Values ('Journals');
Insert into Genre ([GenreDetails]) Values ('Prayer books');
Insert into Genre ([GenreDetails]) Values ('Series');
Insert into Genre ([GenreDetails]) Values ('Trilogy');
Insert into Genre ([GenreDetails]) Values ('Biographies');
Insert into Genre ([GenreDetails]) Values ('Autobiographies');
Insert into Genre ([GenreDetails]) Values ('Fantasy');

insert into Location (ShelfRow, FloorIsle) values (11, 6);
insert into Location (ShelfRow, FloorIsle) values (12, 3);
insert into Location (ShelfRow, FloorIsle) values (10, 9);
insert into Location (ShelfRow, FloorIsle) values (3, 2);
insert into Location (ShelfRow, FloorIsle) values (10, 10);
insert into Location (ShelfRow, FloorIsle) values (1, 6);
insert into Location (ShelfRow, FloorIsle) values (3, 10);
insert into Location (ShelfRow, FloorIsle) values (10, 8);
insert into Location (ShelfRow, FloorIsle) values (3, 8);
insert into Location (ShelfRow, FloorIsle) values (10, 5);

insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Kory', 'Lumbers', '9 Holy Cross Point', 'klumbers0@yale.edu', '748-818-6501', 'Assistant Manager', 18.25, '11/14/2016', 1);
insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Ripley', 'Littlemore', '88411 Pierstorff Plaza', 'rlittlemore1@unesco.org', '763-241-7022', 'Staff Lead', 17.55, '11/14/2016', 1);
insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Sherri', 'Waliszewski', '016 Butterfield Drive', 'swaliszewski2@instagram.com', '460-703-2097', 'Stocker', 11.89, '11/14/2016', 1);
insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Sloan', 'Ivanichev', '4 Hermina Junction', 'sivanichev3@arstechnica.com', '669-888-4483', 'Front Desk', 12.42, '11/14/2016', 1);
insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Gherardo', 'McManus', '2093 Cordelia Parkway', 'gmcmanus4@imgur.com', '991-727-8196', 'Manager', 19.30, '11/14/2016', 1);
insert into Employees (Em_First, Em_Last, Address, Email, Phone, JobTitle, PayRate, HiredDate, Employed) values ('Eimile', 'Wyeth', '586 Scott Street', 'ewyeth5@rambler.ru', '755-699-2356', 'Security', 14.19, '11/14/2016', 1);

insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Inferno: A Novel (Robert Langdon Book 4)', 'Time', 'Cinema Paradiso (Nuovo cinema Paradiso)');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('The Likeness (Dublin Murder Squad, Book 2)', 'Family Circle', 'Jean de Florette');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Wickedly Dangerous (Baba Yaga Book 1)', 'The New Yorker', 'Pine Flat');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Friction','National Geographic', 'Story of Vernon and Irene Castle, The');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Bloodline: A Sigma Force Novel ', 'Game Informer', 'Go Fish');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Harry Potter and the Half-Blood Prince', 'US Weekly', 'Eaux d''artifice');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('The Orphans Tale', 'AARP The Magazine', 'Deep Rising');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Oathbringer', 'Vogue', 'In the Bleak Midwinter');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('The Lord of the Rings', 'People', 'Amazing Johnathan: Wrong on Every Level');
insert into Publications (BookTitle, MagTitle, MediaTitle) values ('Patient Zero ( A Joe Ledge Novel)', 'Readers Digest', 'When the Last Sword is Drawn (Mibu gishi den)');

Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (537244437-1,'Inferno: A Novel (Robert Langdon Book 4)',1,8,4,'Dan Brown','Anchor','05/14/2013',15.00,2);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (515796934-1,'The Likeness (Dublin Murder Squad, Book 2)',2,3,6,'Tana French','Penguin Books','07/17/2008',11.00,3);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (004366723-6,'Wickedly Dangerous (Baba Yaga Book 1)',3,5,11,'Deborah Blake','Berkley','09/02/2014',8.00,1);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (972156317-4,'Friction: Passion Brands in the Age of Distruption',4,5,24,'Jeff Rosenblum,Jordan Berg','powerHouse Books','11/14/2017',18.70,1);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (471529723-7,'Bloodline: A Sigma Force Novel',5,9,30,'James Rollins','William Morrow','06/26/2012',10.00,1);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (806288945-9,'Harry Potter and the Half-Blood Prince',6,4,18,'J.K. Rowling','Pottermore','12/8/2015',13.00,2);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (049156835-5,'The Orphans Tale',7,4,16,'Pam Jenoff','MIRA','02/21/2017',15.00,2);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (826005384-5,'Oathbringer',8,8,25,'Brandon Sanderson','Tor Books','11/14/2017',34.00,2);
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (470669655-0,'The Lord of the Rings',9,3,20,'J.R.R. Tolkien','Houghton Mifflin Harcourt','02/15/2012', 23.00,2) ;
Insert into Books ([ISBN],[BookTitle],[PubID],[LocationID],[GenreID],[Author],[BookPub],[Published],[Price],[Available]) Values (749992619-2,'Patient Zero ( A Joe Ledger Novel)',10,2,5,'Jonathan Maberry','St. Martins Griffin','03/03/2009',14.00,2);


Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('Time','Meredith Corporation',9,1,'03/3/1923',4.99,8);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('Family Circle','Meredith Corporation',5,2,'01/01/1932',6.50,8);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('The New Yorker','Condé Nast',2,3,'02/21/1925',5.00,9);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('National Geographic','National Geographic Society',3,4,'09/22/1888',10.00,8);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('Game Informer','GameStop',4,5,'08/1/1991',6.00,11);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('US Weekly','Wenner Media LLC',7,6,'05/03/1977',7.00,5);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('AARP The Magazine','AARP',8,7,'01/01/1958',6.00,4);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('Vogue','Condé Nast',10,8,'12/17/1892',9.00,4);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('People','Karen Kovacs',1,9,'03/04/1974',7.00,6);
Insert into Magazines ([MagTitle],[MagPub],[GenreID],[LocationID],[MagPubdate],[Price],[Available]) Values ('Readers Digest','DeWitt Wallace',6,10,'02/05/1922',4.50,10);


Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Les Films Ariane','Cinema Paradiso (Nuovo cinema Paradiso)',5,3,'Giuseppe Tornatore',20.00,2);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Orion Pictures ','Jean de Florette',3,3,'Claude Berri',12.00,2);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Sharon Lockhart','Pine Flat',8,22,'Sharon Lockhart',10.00,1);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('RKO Radio Pictures','Story of Vernon and Irene Castle, The',3,11,'H. C. Potter',14.00,2);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Samuel Goldwyn Company','Go Fish', 8,3,'Rose Troche', 12.00,1);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Kenneth Anger','Eaux d''artifice',4,17,'Kenneth Anger',5.00,1);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Hollywood Pictures,Cinergi Pictures','Deep Rising',7,7,'Stephen Sommers',12.99,2);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Castle Rock Entertainment','In the Bleak Midwinter',9,24,'Kenneth Branagh',12.00,3);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('Rickmill Productions','Amazing Johnathan: Wrong on Every Level',10,19,'Paul Miller',10.00,1);
Insert into Media ([MedProd],[MediaTitle],[LocationID],[GenreID],[Director],[Price],[Available]) Values ('TV Tokyo,Shochiku Company','When the Last Sword is Drawn (Mibu gishi den)',8,15,'Yôjirô Takita', 25.00,1);




