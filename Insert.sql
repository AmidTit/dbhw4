INSERT INTO genre (name)
VALUES
	('Rap'),
	('Pop'),
	('Rock'),
	('Classic'),
	('Electronic');

INSERT INTO singer (name)
VALUES
	('Eminem'),
	('Dr.Dre'),
	('Michael Jackson'),
	('Justin Bieber'),
	('Guns n Roses'),
	('Scorpions'),
	('Luke Howard'),
	('Trevor Kowalski'),
	('Skrillex'),
	('Marshmello');
	

INSERT INTO singergenre (singer_id, genre_id) 
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 4),
	(9, 5),
	(10, 5);


INSERT INTO album (name, publishing_year)
VALUES
	('Killer', 2022),
	('I Need A Doctor', 2011),
	('Bad', 2012),
	('Baby', 2010),
	('Use Your Illusion I', 1991),
	('Love At First Sting', 1984),
	('More Heart Stories', 2018),
	('And We Walk After', 2021),
	('I Wanna Be Skrillex', 2012),
	('Ritual', 2012);
	
	
INSERT INTO singeralbum (singer_id, album_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);
	
INSERT INTO digest (name, publishing_year)
VALUES
	('top_rap', 2022),
	('top_pop', 2018),
	('top_rock', 2017),
	('top_classic', 2015),
	('top_electronic', 2021),
	('rap_pop', 2022),
	('pop_electronic', 2023),
	('rap_classic', 2021),
	('pop_rock', 2014),
	('rap_electronic', 2022);
	
INSERT INTO track (name, duration, album_id, digest_id)
VALUES
	('Killer', 236, 1, 1),
	('Killshot', 253, 1, 8),
	('I Need A Doctor', 283, 2, 10),
	('Gospel', 210, 2, 6),
	('Bad', 216, 3, 2),
	('Blood On The Dance Floor', 219, 3, 6),
	('Baby', 216, 4, 9),
	('I Don`t Care', 219, 4, 6),
	('Live And Let Die', 182, 5, 3),
	('Don`t Cry', 284, 5, 9),
	('Crossfire', 213, 6, 3),
	('Big City Nights', 271, 6, 9),
	('Open', 182, 7, 4),
	('Sky', 296, 7, 7),
	('Striving', 151, 8, 7),
	('And We Walk After', 168, 8, 4),
	('In Da Getto', 130, 9, 5),
	('Bangarang', 215, 9, 6),
	('Ritual', 227, 10, 10),
	('Spotlight', 227, 10, 5);
	