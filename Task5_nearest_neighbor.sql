-- Create a new table to store the lines
CREATE TABLE lines_of_interest AS
SELECT
    'Line ' || ROW_NUMBER() OVER () AS name,
    ST_MakeLine(
        p1.geom, p2.geom
    ) AS geom
FROM
    (SELECT * FROM points_of_interest WHERE name = 'Apartment') AS p1,
    (SELECT * FROM points_of_interest WHERE name IN ('Blue phone 1', 'Cafe Dulce', 'Fubon Fountain', 'Starbucks 2')) AS p2;

-- Check the inserted lines
SELECT * FROM lines_of_interest;
