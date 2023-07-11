--Количество исполнителей в каждом жанре.
SELECT g."name", COUNT(s."name") FROM genre g 
LEFT JOIN singergenre sg ON g.id = sg.genre_id 
LEFT JOIN singer s ON s.id = sg.singer_id 
GROUP BY g."name";

--Количество треков, вошедших в альбомы 2021–2022 годов.
SELECT a."name" , a.publishing_year  , COUNT(t."name") as tracks_count FROM album a 
LEFT JOIN track t ON t.album_id = a.id
WHERE a.publishing_year BETWEEN 2021 AND 2022
GROUP BY a."name", a.publishing_year;

--Средняя продолжительность треков по каждому альбому.
SELECT a."name" as album, AVG(t.duration) as avg_duration FROM track t 
LEFT JOIN album a ON a.id = t.album_id
GROUP BY a."name";

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT s."name" FROM singer s
WHERE s."name" NOT IN 
(
	SELECT DISTINCT s."name" FROM singer s 
	LEFT JOIN singeralbum s2 ON s2.singer_id = s.id 
	LEFT JOIN album a ON a.id = s2.album_id
	WHERE a.publishing_year = 2020
)
ORDER BY s."name" 

--Названия сборников, в которых присутствует конкретный исполнитель.
SELECT d."name" FROM digest d 
LEFT JOIN track t ON t.digest_id = d.id 
LEFT JOIN album a ON a.id = t.id 
LEFT JOIN singeralbum sa ON sa.album_id = a.id 
LEFT JOIN singer s ON s.id = sa.singer_id 
WHERE s."name" = 'Eminem'

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a."name" FROM album a 
LEFT JOIN singeralbum sa ON sa.album_id = a.id 
LEFT JOIN singer s ON s.id = sa.singer_id 
LEFT JOIN singergenre sg ON sg.singer_id = s.id 
LEFT JOIN genre g  ON g.id = sg.genre_id 
GROUP BY a.name
HAVING COUNT(DISTINCT g."name") > 1

--Наименования треков, которые не входят в сборники.
SELECT t."name" FROM track t 
LEFT JOIN digest d ON d.id  = t.digest_id 
WHERE t.id IS NULL 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s."name", t.duration  FROM singer s 
LEFT JOIN singeralbum sa ON sa.singer_id = s.id 
LEFT JOIN album a ON a.id = sa.album_id 
LEFT JOIN track t ON t.album_id = a.id 
WHERE t.duration = (SELECT MIN(t.duration) FROM track t)
GROUP BY s."name", t.duration 

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a."name" FROM album a 
LEFT JOIN track t ON t.album_id = a.id 
WHERE t.album_id IN
(
	SELECT album_id FROM track 
	GROUP BY album_id
	HAVING COUNT(id) = 
	(
		SELECT COUNT(id) FROM track 
		GROUP BY album_id
        ORDER BY COUNT
        LIMIT 1
	)
)
GROUP BY a."name" 
