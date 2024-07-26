SELECT m.id, m.movie_title, m.release_date, m.duration, m.movie_description, 
		JSON_OBJECT('id', f.id, 'file_name', f.file_name, 'mime_type', f.mime_type, 'file_key', f.file_key, 'file_url', f.file_url) AS poster,
		JSON_OBJECT('id', p.id, 'first_name', p.first_name, 'last_name', p.last_name) AS director
	FROM movies m
	JOIN persons p ON m.director_id = p.id
    JOIN files f ON f.id = m.poster_id
	JOIN movies_genres mg ON m.id = mg.movie_id
	JOIN genres g ON mg.genre_id = g.id
	WHERE m.country_id = 1
		AND m.release_date >= '2022-01-01'
		AND TIME_TO_SEC(m.duration) > 2 * 3600 + 15 * 60
		AND (g.genre_name = 'Action' OR g.genre_name = 'Drama');