-- Create Books table
CREATE TABLE books (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(200) NOT NULL,
  cover_state VARCHAR(200) NOT NULL,  
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Create labels table
CREATE TABLE labels (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
);

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
