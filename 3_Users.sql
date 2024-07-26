SELECT m.id AS movie_id, m.movie_title, COUNT(mp.person_id) AS actor_count
	FROM movies m
	JOIN movies_persons mp ON mp.movie_id = m.id
	WHERE m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
	GROUP BY m.id, m.movie_title;