-- Challenge 1 advance SQL

SELECT titles.title_id AS 'Title ID',
authors.au_id AS 'Author ID',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Sales_Royalty'

FROM publications.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

ORDER BY Sales_Royalty;

-- Step 2 Calculate the royalties of each sales for each author.

-- CREO UNA TABLA TEMPORAL DEL EJERCICIO 1.

drop temporary table if exists royalties_resumen;

CREATE TEMPORARY TABLE royalties_resumen
SELECT titles.title_id AS 'Title_ID',
authors.au_id AS 'Author_ID',
authors.au_lname AS 'LAST_NAME',
authors.au_fname AS 'FIRST_NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Sales_Royalty'

FROM publications.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

ORDER BY authors.au_id, titles.title_id;

-- HAGO EL EJERCICIO CON LA TABLA TEMPORAL

SELECT 
	royalties_resumen.Title_ID AS 'Title_ID',
	royalties_resumen.Author_ID AS 'Author_ID',
	sum(Sales_Royalty) AS 'Aggregated_Royalties'

FROM royalties_resumen
group by royalties_resumen.Author_ID, royalties_resumen.Title_ID;

-- Step 3: Calculate the total profits of each author
-- CREO UNA TABLA TEMPORAL DEL EJERCICIO 2

drop temporary table if exists tabla2;

CREATE TEMPORARY TABLE tabla2
SELECT 
	royalties_resumen.Title_ID AS 'Title_ID',
	royalties_resumen.Author_ID AS 'Author_ID',
    sum(Sales_Royalty) AS 'Aggregated_Royalties'

FROM royalties_resumen
group by royalties_resumen.Author_ID, royalties_resumen.Title_ID;

-- HAGO EL EJERCICIO CON LA TABLA TEMPORAL

SELECT
tabla2.Title_ID,
tabla2.Author_ID,
sum(Aggregated_Royalties + titles.advance) AS 'PROFITS'

FROM tabla2

INNER JOIN titles 
ON tabla2.Title_ID = titles.title_id

GROUP BY tabla2.Author_ID, tabla2.Title_ID
ORDER BY PROFITS DESC
LIMIT 3;

-- Challenge 2

-- ME FALTA HACER ESTE EJERCICIO

-- Challenge 3

-- CREO UNA TABLA PERMANENTE DEL PASO 3

CREATE TABLE most_profiting_authors

SELECT
tabla2.Title_ID,
tabla2.Author_ID,
sum(Aggregated_Royalties + titles.advance) AS 'PROFITS'

FROM tabla2

INNER JOIN titles 
ON tabla2.Title_ID = titles.title_id

GROUP BY tabla2.Author_ID, tabla2.Title_ID
ORDER BY PROFITS DESC
LIMIT 3;

-- USO LA TABLA PERMANENTE

SELECT
most_profiting_authors.Author_ID,
most_profiting_authors.PROFITS

FROM most_profiting_authors;

