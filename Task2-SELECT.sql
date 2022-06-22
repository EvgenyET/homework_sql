SELECT name_album, year_of_release_album FROM albums
	WHERE year_of_release_album = 2018
   
SELECT name_track, duration FROM tracks
	ORDER BY duration DESC
	LIMIT 1;
	
SELECT name_track, duration FROM tracks
	WHERE duration > 3.5
	
SELECT name_digest FROM digests
    WHERE year_of_release_digest >= 2018 and year_of_release_digest <= 2020;
    
SELECT nickname FROM musicians
    WHERE nickname NOT LIKE '% %';
    
SELECT name_track FROM tracks
    WHERE name_track LIKE '%мой%' OR name_track LIKE '%my%';