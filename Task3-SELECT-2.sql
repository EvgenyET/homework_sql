SELECT name_genre,COUNT(musician) FROM musicians
    JOIN genre_musician ON musicians.id = genre_musician.musician_id
    JOIN genres ON genre_musician.genres_id = genres.id
    GROUP BY name_genre; 
   
SELECT year_of_release_album,COUNT(name_track) FROM albums a
    JOIN tracks t  ON a.id = t.album_id
    WHERE a.year_of_release_album  >= 2019 AND a.year_of_release_album <= 2020
    GROUP BY year_of_release_album;

SELECT name_album,AVG(duration) FROM albums a
    JOIN tracks t  ON a.id = t.album_id
    GROUP BY name_album;     
   
SELECT musician,year_of_release_album FROM albums a
    JOIN musicians_albums ma  ON a.id = ma.album_id
    JOIN musicians m  ON ma.musician_id = m.id
    WHERE a.year_of_release_album != 2020;
   
SELECT name_digest FROM digests d
    JOIN composition_digest cd  ON d.id = cd.digest_id
    JOIN tracks t  ON cd.track_id = t.id
    JOIN albums a  ON t.album_id = a.id
    JOIN musicians_albums ma  ON a.id = ma.album_id
    JOIN musicians m  ON ma.musician_id = m.id
    WHERE m.musician LIKE 'Руки Вверх';
   
SELECT name_album FROM albums a
    JOIN musicians_albums ma  ON a.id = ma.album_id
    JOIN musicians m  ON ma.musician_id = m.id
    JOIN genre_musician gm  ON m.id = gm.musician_id
    GROUP BY m.musician, a.name_album
    HAVING count(gm.genres_id) > 1;

 SELECT name_track FROM tracks t
    LEFT JOIN composition_digest cd ON t.id = cd.track_id
    WHERE cd.track_id IS NULL;
    
SELECT m.musician, t.duration FROM musicians m
    JOIN musicians_albums ma ON m.id = ma.musician_id
    JOIN albums a ON ma.album_id = a.id
    JOIN tracks t ON a.id = t.album_id
    WHERE t.duration IN (SELECT MIN(duration) FROM tracks)
    
SELECT a.name_album, COUNT(t.id) FROM albums a
    JOIN tracks t  ON a.id = t.album_id
    GROUP BY a.name_album 
    HAVING count(t.id) in (
    SELECT COUNT (t.id)
    FROM albums a
    JOIN tracks t  ON a.id = t.album_id
    GROUP BY a.name_album
    ORDER BY count(t.id)
    LIMIT 1)