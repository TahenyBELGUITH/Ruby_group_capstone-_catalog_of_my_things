CREATE TABLE author
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name  VARCHAR(100)
)

CREATE TABLE game
(
    id             SERIAL PRIMARY KEY,
    publish_date   DATE,
    archived       BOOLEAN,
    multiplayer    BOOLEAN,
    last_played_at DATE,
    author_id      INTEGER REFERENCES author (id)
)