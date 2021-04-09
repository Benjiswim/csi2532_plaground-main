SELECT *
FROM artists
WHERE birthplace = 'Ottawa';

//Returns all artists born in Ottawa


SELECT title, price
FROM artworks
WHERE year = 2000;

//Returns Name and price of all artworks made in 2000


UPDATE customers
SET amount = 9.8
WHERE address = 'Gatineau';

//Updates the amount for customers from Gatineau to 9.8


DELETE
FROM customers
WHERE name = 'John';

//Delete all customers whose name is John


ALTER TABLE artists
ADD COLUMN country varchar(100);

//Adds a country of origin column



ALTER TABLE customers
ADD COLUMN rating integer CHECK (rating between 1 and 10);

//Adds a rating column to the customers


INSERT INTO customers
(id, name, address, amount, rating)
VALUES
(4, 'Emre', 'Preston', 20000.00, 5),
(5, 'Saeid', null, 40000.00, 6);
INSERT INTO artists
(name, birthplace, style, dateofbirth, country)
VALUES
('Leonardo', 'Florence', 'Renaissance', '04-15-1452', 'Italy'),
('Michelangelo', 'Arezzo', 'Renaissance', '03-06-1475',
'Italy'),
('Josefa', 'Seville', 'Baroque', '09-09-1630', 'Spain'),
('Hans Hofmann', 'Weisenburg', 'Modern', '02-17-1966', 'Germany'),
('John', 'San Francisco', 'Modern', '02-17-1920', 'USA');
INSERT INTO artworks
(title, year, type, price, artist_name)
VALUES
('Waves', 2000, null, 4000.00, 'Smith'),
('Three Musicians', 1921, 'Modern', 11000.00, 'Picasso');
INSERT INTO likeartists
(customer_id, artist_name)
VALUES
(4, 'Picasso'),
(5, 'Picasso'),
(5, 'Leonardo');

//Insert more data


DELETE
FROM artworks
WHERE artist_name = 'Smith';
//Delete all atwork by Smith
DELETE
FROM artists
WHERE name = 'Smith';
//Delete the artist Smith




--------LAB06------

Name and birthplace of all artists

SELECT name,birthplace
FROM artists;

Title and price of all artwork after 1600

SELECT title,price
FROM artworks
WHERE year > 1600;

Title and type of artworks in 2000 or by Picasso

SELECT title,type
FROM artworks
WHERE year = 2000 OR artist_name = "Picasso";

Name and birthplace of artists born between 1880 and 1930

SELECT name,birthplace
FROM artists
WHERE EXTRACT(YEAR FROM dateofbirth) > 1880 AND EXTRACT(YEAR FROM dateofbirth) < 1930;

Name and country of birth of artists with style Modern Baroque or Renaissance

SELECT name,country
FROM artists
WHERE style IN ("Modern","Baroque","Renaissance");

All info on artworks sort by title

SELECT *
FROM artworks
ORDER BY title

Name and customerid of customers who liked Picasso

SELECT name,customerid
FROM customers
INNER JOIN likeartists
ON customers.customerid = likeartists.customerid
WHERE likeartists.artistname = "Picasso";

Name of all customers who like renaissance artistes who's prices are above 30000

SELECT *
FROM artists as A
INNER JOIN artworks
ON artworks.artists_name = A.name
WHERE artworks.price > 30000 AND A.style = "Renaissance"
SELECT customer_id
FROM likedartists as L
INNER JOIN A
ON A.name = L.artists_name
SELECT name
FROM customers
INNER JOIN L
ON L.customer_id = customers.id;





