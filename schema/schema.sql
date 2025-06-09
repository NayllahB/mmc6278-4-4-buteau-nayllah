CREATE DATABASE IF NOT EXISTS music_db;

USE music_db;

CREATE TABLE artists (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE albums (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR (100) NOT NULL,
  artist_id INT NOT NULL,
  release_year INT NOT NULL,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE
);

CREATE TABLE songs (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  track_number INT NOT NULL,
  artist_id INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE,
  FOREIGN KEY (album_id)
    REFERENCES albums (id)
    ON DELETE CASCADE
);

-- Remember to use a comma BETWEEN each line!

-- NOTE: The foreign key constraints above ensure that when, for example,
-- an artist is deleted, that artist's songs and albums are also removed.
-- When an album is removed, that album's songs are also removed.