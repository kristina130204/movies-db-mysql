ER Diagram code

erDiagram

    FILES {
        INT id PK
        VARCHAR file_name
        VARCHAR mime_type
        VARCHAR file_key
        VARCHAR file_url
        TIMESTAMP created_at
        DATETIME updated_at
    }

    USERS {
        INT id PK
        VARCHAR username
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email
        VARCHAR user_password
        INT avatar_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    COUNTRIES {
        INT id PK
        VARCHAR country_name
        TIMESTAMP created_at
        DATETIME updated_at
    }

    PERSONS {
        INT id PK
        VARCHAR first_name
        VARCHAR last_name
        TEXT biography
        DATE date_of_birth
        TINYINT gender
        INT home_country_id FK
        INT primary_image_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    PERSONS_FILES {
        INT person_id FK
        INT image_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    MOVIES {
        INT id PK
        VARCHAR movie_title
        TEXT movie_description
        BIGINT budget
        DATE release_date
        TIME duration
        INT director_id FK
        INT country_id FK
        INT poster_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    CHARACTERS {
        INT id PK
        VARCHAR character_name
        TEXT character_description
        ENUM character_role
        INT actor_id FK
        VARCHAR actor_full_name
        TIMESTAMP created_at
        DATETIME updated_at
    }

    USERS_MOVIES {
        INT user_id FK
        INT movie_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    GENRES {
        INT id PK
        VARCHAR genre_name
        TIMESTAMP created_at
        DATETIME updated_at
    }

    MOVIES_GENRES {
        INT movie_id FK
        INT genre_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    MOVIES_CHARACTERS {
        INT movie_id FK
        INT character_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    MOVIES_PERSONS {
        INT movie_id FK
        INT person_id FK
        TIMESTAMP created_at
        DATETIME updated_at
    }

    USERS ||--o{ FILES : "avatar_id"
    PERSONS ||--o{ COUNTRIES : "home_country_id"
    PERSONS ||--o{ FILES : "primary_image_id"
    PERSONS_FILES ||--o{ PERSONS : "person_id"
    PERSONS_FILES ||--o{ FILES : "image_id"
    MOVIES ||--o{ PERSONS : "director_id"
    MOVIES ||--o{ COUNTRIES : "country_id"
    MOVIES ||--o{ FILES : "poster_id"
    CHARACTERS ||--o{ PERSONS : "actor_id"
    USERS_MOVIES ||--o{ USERS : "user_id"
    USERS_MOVIES ||--o{ MOVIES : "movie_id"
    MOVIES_GENRES ||--o{ MOVIES : "movie_id"
    MOVIES_GENRES ||--o{ GENRES : "genre_id"
    MOVIES_CHARACTERS ||--o{ MOVIES : "movie_id"
    MOVIES_CHARACTERS ||--o{ CHARACTERS : "character_id"
    MOVIES_PERSONS ||--o{ MOVIES : "movie_id"
    MOVIES_PERSONS ||--o{ PERSONS : "person_id"
