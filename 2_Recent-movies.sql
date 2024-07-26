SELECT p.id AS actor_id, p.first_name, p.last_name, SUM(m.budget) AS total_budget
	FROM persons p
    JOIN movies_persons mp ON mp.person_id = p.id
    JOIN movies m ON m.id = mp.movie_id
	GROUP BY p.id, p.first_name, p.last_name;