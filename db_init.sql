/*
Author: Katie Klein
Course: CSD 460
Date: 16 January 2022
Project: YouTunes
*/

/* This MySQL file should be run prior to using the YouTunes application.
This file will create the youtunes database, an associated user, and tables.
*/

/* Create database */
DROP DATABASE IF EXISTS youtunes;
CREATE DATABASE youtunes;

/* Create user and grant permisisons */
DROP USER IF EXISTS 'youtunes_user'@'localhost';
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'tunesPass';
GRANT ALL PRIVILEGES ON youtunes.* TO 'youtunes_user'@'localhost';

USE youtunes;

/* Create artists table */
CREATE TABLE IF NOT EXISTS artists (
  artist_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50),
  PRIMARY KEY (artist_id)
);

/* Create albums table */
CREATE TABLE IF NOT EXISTS albums (
  album_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL,
  genre VARCHAR(50) NOT NULL,
  img_url VARCHAR(100),
  artist_id INT NOT NULL,
  release_year INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

/* Populate artists table */
INSERT INTO artists (first_name, last_name)
  VALUES("Phoebe", "Bridgers");
INSERT INTO artists (first_name)
  VALUES("Muse");  
INSERT INTO artists (first_name)
  VALUES("Death Cab for Cutie");
INSERT INTO artists (first_name, last_name)
  VALUES("Lana", "Del Rey");
INSERT INTO artists (first_name)
  VALUES("OK Go");
INSERT INTO artists (first_name, last_name)
  VALUES("Wolfgang Amadeus", "Mozart");
INSERT INTO artists (first_name, last_name)
  VALUES("Willie", "Nelson");
INSERT INTO artists (first_name, last_name)
  VALUES("Kacey", "Musgraves");
INSERT INTO artists (first_name, last_name)
  VALUES("Sufjan", "Stevens");
INSERT INTO artists (first_name)
  VALUES("Fleet Foxes");
INSERT INTO artists (first_name, last_name)
  VALUES("Michael", "Jackson");
INSERT INTO artists (first_name)
  VALUES("Prince");
INSERT INTO artists (first_name)
  VALUES("Cher");
INSERT INTO artists (first_name, last_name)
  VALUES("Phil", "Collins");
INSERT INTO artists (first_name, last_name)
  VALUES("Lauryn", "Hill");
INSERT INTO artists (first_name)
  VALUES("The Mamas and the Papas");
INSERT INTO artists (first_name, last_name)
  VALUES("Etta", "James");
INSERT INTO artists (first_name, last_name)
	VALUES("Nat King", "Cole");
INSERT INTO artists (first_name)
	VALUES("Boston");

/* Populate albums table */
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Punisher", 16.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Phoebe" AND last_name = "Bridgers"), 2020);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Stranger in the Alps", 16.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Phoebe" AND last_name = "Bridgers"), 2017);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("The Resistance", 18.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2009);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Showbiz", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 1999);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Simulation Theory", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2018);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Origin of Symmetry", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2001);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Transatlanticism", 14.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Death Cab for Cutie" AND last_name IS NULL), 2003);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Ultraviolence", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2014);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Born to Die", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2012);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Honeymoon", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2015);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Of the Blue Colour of the Sky", 14.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "OK Go" AND last_name IS NULL), 2010);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Mozart: Requiem", 9.99, "classical", (SELECT artist_id FROM artists WHERE first_name = "Wolfgang Amadeus" AND last_name = "Mozart"), 1999);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Stardust", 9.99, "country", (SELECT artist_id FROM artists WHERE first_name = "Willie" AND last_name = "Nelson"), 1978);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Golden Hour", 15.99, "country", (SELECT artist_id FROM artists WHERE first_name = "Kacey" AND last_name = "Musgraves"), 2018);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Carrie & Lowell", 16.99, "indie folk", (SELECT artist_id FROM artists WHERE first_name = "Sufjan" AND last_name = "Stevens"), 2015);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Fleet Foxes", 14.99, "indie folk", (SELECT artist_id FROM artists WHERE first_name = "Fleet Foxes" AND last_name IS NULL), 2008);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Thriller", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Michael" AND last_name = "Jackson"), 1982);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Bad", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Michael" AND last_name = "Jackson"), 1987);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Purple Rain", 12.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Prince" AND last_name IS NULL), 1984);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Sign o' the Times", 12.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Prince" AND last_name IS NULL), 1987);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Believe", 13.99, "disco", (SELECT artist_id FROM artists WHERE first_name = "Cher" AND last_name IS NULL), 1998);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Face Value", 13.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Phil" AND last_name = "Collins"), 1981);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("The Miseducation of Lauryn Hill", 14.99, "hiphop", (SELECT artist_id FROM artists WHERE first_name = "Lauryn" AND last_name = "Hill"), 1998);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("If You Can Believe Your Eyes", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "The Mamas and the Papas" AND last_name IS NULL), 1966);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("At Last", 12.99, "blues", (SELECT artist_id FROM artists WHERE first_name = "Etta" AND last_name = "James"), 1960);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("After Midnight", 11.99, "jazz", (SELECT artist_id FROM artists WHERE first_name = "Nat King" AND last_name = "Cole"), 1957);
INSERT INTO albums (title, price, genre, artist_id, release_year)
  VALUES("Boston", 15.99, "rock", (SELECT artist_id FROM artists WHERE first_name = "Boston" AND last_name IS NULL), 1976);