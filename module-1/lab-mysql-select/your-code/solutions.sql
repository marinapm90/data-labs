-- challenge 1

SELECT authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME', 
titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER'

FROM publication.authors

INNER JOIN publication.titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN publication.titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN publication.publishers 
ON publishers.pub_id = titles.pub_id

ORDER BY authors.au_id ASC;


-- Challenge 2

SELECT authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME', 
-- titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER',

COUNT(titles.title) AS 'TITLE COUNT'

FROM publication.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN publishers 
ON publishers.pub_id = titles.pub_id

GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id DESC , publishers.pub_name DESC;

-- Challenge 3

SELECT authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
sum(sales.qty) AS 'TOTAL'

FROM publication.authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN sales 
ON titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;

-- Challenge 4 NO HE CONSEGUIDO PONER LOS NULLS A CERO (HE PROBADO CON CASE, IFNULL y COALESCE)

SELECT authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
sum(sales.qty)

FROM publication.authors

LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

LEFT JOIN titles 
ON titleauthor.title_id = titles.title_id

LEFT JOIN sales 
ON titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 23;