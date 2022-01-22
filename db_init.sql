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
  img_url VARCHAR(100),
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
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Phoebe", "Bridgers", "phoebe-bridgers");
INSERT INTO artists (first_name, img_url)
  VALUES("Muse", "muse");  
INSERT INTO artists (first_name, img_url)
  VALUES("Death Cab for Cutie", "death-cab-for-cutie");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Lana", "Del Rey", "lana-del-rey");
INSERT INTO artists (first_name, img_url)
  VALUES("OK Go", "ok-go");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Wolfgang Amadeus", "Mozart", "wolfgang-amadeus-mozart");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Willie", "Nelson", "willie-nelson");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Kacey", "Musgraves", "kacey-musgraves");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Sufjan", "Stevens", "sufjan-stevens");
INSERT INTO artists (first_name, img_url)
  VALUES("Fleet Foxes", "fleet-foxes");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Michael", "Jackson", "michael-jackson");
INSERT INTO artists (first_name, img_url)
  VALUES("Prince", "prince");
INSERT INTO artists (first_name, img_url)
  VALUES("Cher", "cher");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Phil", "Collins", "phil-collllins");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Lauryn", "Hill", "lauryn-hill");
INSERT INTO artists (first_name, img_url)
  VALUES("The Mamas and the Papas", "the-mamas-and-the-papas");
INSERT INTO artists (first_name, last_name, img_url)
  VALUES("Etta", "James", "etta-james");
INSERT INTO artists (first_name, last_name, img_url)
	VALUES("Nat King", "Cole", "nat-king-cole");
INSERT INTO artists (first_name, img_url)
	VALUES("Boston", "boston");

/* Populate albums table */
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Punisher", 16.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Phoebe" AND last_name = "Bridgers"), 2020, "punisher");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Stranger in the Alps", 16.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Phoebe" AND last_name = "Bridgers"), 2017, "stranger-in-the-alps");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("The Resistance", 18.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2009, "the-resistance");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Showbiz", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 1999, "showbiz");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Simulation Theory", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2018, "simulation-theory");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Origin of Symmetry", 13.99, "alt rock", (SELECT artist_id FROM artists WHERE first_name = "Muse" AND last_name IS NULL), 2001, "origin-of-symmetry");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Transatlanticism", 14.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "Death Cab for Cutie" AND last_name IS NULL), 2003, "transatlanticism");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Ultraviolence", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2014, "ultraviolence");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Born to Die", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2012, "born-to-die");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Honeymoon", 13.99, "alt pop", (SELECT artist_id FROM artists WHERE first_name = "Lana" AND last_name = "Del Rey"), 2015, "honeymoon");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Of the Blue Colour of the Sky", 14.99, "indie rock", (SELECT artist_id FROM artists WHERE first_name = "OK Go" AND last_name IS NULL), 2010, "of-the-blue-colour-of-the-sky");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Mozart: Requiem", 9.99, "classical", (SELECT artist_id FROM artists WHERE first_name = "Wolfgang Amadeus" AND last_name = "Mozart"), 1999, "mozart-requiem");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Stardust", 9.99, "country", (SELECT artist_id FROM artists WHERE first_name = "Willie" AND last_name = "Nelson"), 1978, "stardust");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Golden Hour", 15.99, "country", (SELECT artist_id FROM artists WHERE first_name = "Kacey" AND last_name = "Musgraves"), 2018, "golden-hour");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Carrie & Lowell", 16.99, "indie folk", (SELECT artist_id FROM artists WHERE first_name = "Sufjan" AND last_name = "Stevens"), 2015, "carrie-and-lowell");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Fleet Foxes", 14.99, "indie folk", (SELECT artist_id FROM artists WHERE first_name = "Fleet Foxes" AND last_name IS NULL), 2008, "fleet-foxes");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Thriller", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Michael" AND last_name = "Jackson"), 1982, "thriller");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Bad", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Michael" AND last_name = "Jackson"), 1987, "bad");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Purple Rain", 12.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Prince" AND last_name IS NULL), 1984, "purple-rain");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Sign o' the Times", 12.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Prince" AND last_name IS NULL), 1987, "sign-o-the-times");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Believe", 13.99, "disco", (SELECT artist_id FROM artists WHERE first_name = "Cher" AND last_name IS NULL), 1998, "believe");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Face Value", 13.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "Phil" AND last_name = "Collins"), 1981, "face-value");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("The Miseducation of Lauryn Hill", 14.99, "hiphop", (SELECT artist_id FROM artists WHERE first_name = "Lauryn" AND last_name = "Hill"), 1998, "the-miseducation-of-lauryn-hill");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("If You Can Believe Your Eyes and Ears", 10.99, "pop rock", (SELECT artist_id FROM artists WHERE first_name = "The Mamas and the Papas" AND last_name IS NULL), 1966, "if-you-can-believe-your-eyes-and-ears");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("At Last", 12.99, "blues", (SELECT artist_id FROM artists WHERE first_name = "Etta" AND last_name = "James"), 1960, "at-last");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("After Midnight", 11.99, "jazz", (SELECT artist_id FROM artists WHERE first_name = "Nat King" AND last_name = "Cole"), 1957, "after-midnight");
INSERT INTO albums (title, price, genre, artist_id, release_year, img_url)
  VALUES("Boston", 15.99, "rock", (SELECT artist_id FROM artists WHERE first_name = "Boston" AND last_name IS NULL), 1976, "boston");