SELECT 
	u.id, u.username, m.id AS movie_id
    FROM users u
    LEFT JOIN users_movies um ON um.user_id = u.id 
    LEFT JOIN movies m ON um.movie_id = m.id;