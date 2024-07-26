SELECT m.id, m.movie_title, m.release_date, m.duration, m.movie_description, 
       JSON_OBJECT('id', f.id, 'file_name', f.file_name, 'mime_type', f.mime_type, 'file_key', f.file_key, 'file_url', f.file_url) AS poster,
       JSON_OBJECT('id', p.id, 'first_name', p.first_name, 'last_name', p.last_name) AS director,
       (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', a.id, 'first_name', a.first_name, 'last_name', a.last_name,
                                         'photo', JSON_OBJECT('id', af.id, 'file_name', af.file_name, 'mime_type', af.mime_type, 'file_key', af.file_key, 'file_url', af.file_url)))
        FROM persons a
        JOIN movies_persons mp ON mp.movie_id = m.id
        JOIN files af ON a.primary_image_id = af.id
        WHERE mp.person_id = a.id) AS actors,
       (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', g.id, 'name', g.genre_name))
        FROM genres g
        JOIN movies_genres mg ON g.id = mg.genre_id
        WHERE mg.movie_id = m.id) AS genres
FROM movies m
JOIN persons p ON m.director_id = p.id
JOIN files f ON m.poster_id = f.id
WHERE m.id = 1;