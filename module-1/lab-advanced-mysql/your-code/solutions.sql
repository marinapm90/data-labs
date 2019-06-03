-- Challenge 1 advance SQL

-- Step 1 Calculate the royalties of each sales for each author

SELECT titles.title_id AS 'Title ID',
authors.au_id AS 'Author ID',
-- authors.au_lname AS 'LAST NAME',
-- authors.au_fname AS 'FIRST NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Sales_Royalty'

FROM publications.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

ORDER BY Sales_Royalty;

-- Step 2 Aggregate the total royalties for each title for each author

SELECT titles.title_id AS 'Title ID',
authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Aggregated_Royalties'

FROM publications.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

GROUP BY authors.au_id, titles.title_id
ORDER BY Aggregated_Royalties;

-- Step 3: Calculate the total profits of each author

SELECT 
authors.au_id AS 'Author ID',
sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 + titles.advance) AS 'PROFITS'

FROM publications.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

GROUP BY authors.au_id, titles.title_id
ORDER BY PROFITS DESC
LIMIT 3;

-- Challenge 2 - Alternative Solution

