CREATE EXTENSION postgis;


CREATE TABLE points_of_interest (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    geom GEOMETRY(Point, 4326) -- Assuming the data is in WGS 84 coordinate system
);

-- Inserting sample data into the table
INSERT INTO points_of_interest (name, geom) VALUES
('Apartment', 'POINT(-118.2830918305793 34.031776656481114)'),
('Starbucks 1', 'POINT(-118.28257924931597 34.02132325327035)'),
('EEB', 'POINT(-118.28998112743871 34.01986255047886)'),
('Blue phone 1', 'POINT(-118.28252605239291 34.02518082354204)'),
('Fountain 1', 'POINT(-118.28341635398651 34.020487906902055)'),
('ACCT', 'POINT(-118.28577093862148 34.01929165111162)'),
('Blue phone 2', 'POINT(-118.28662459246014 34.02191910076206)'),
('Cafe Dulce', 'POINT(-118.2852286664769 34.025338357374864)'),
('USC SCA', 'POINT(-118.28630966886114 34.023676239768996)'),
('Blue phone 3', 'POINT(-118.28569701197425 34.022533315072295)'),
('Starbucks 2', 'POINT(-118.28440071899372 34.024518828430885)'),
('Fubon Fountain', 'POINT(-118.28500458990884 34.025235918056055)'),
('Fountain 3', 'POINT(-118.2852336211807 34.02026447079041)');

SELECT name, geom FROM points_of_interest;

-- Create a new table to store the convex hull
CREATE TABLE convex_hull AS
SELECT ST_ConvexHull(ST_Collect(geom)) AS geom
FROM points_of_interest;

SELECT ST_AsText(geom) AS convex_hull_geometry
FROM convex_hull;
