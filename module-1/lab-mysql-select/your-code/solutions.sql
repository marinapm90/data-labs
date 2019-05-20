--SELECT authors.au_id , authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, titleauthor.title_id,  titles.pub_id FROM publication.authors
--INNER JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
--INNER JOIN publication.titles ON titleauthor.title_id = titles.title_id
--INNER JOIN publication.publishers ON publishers.pub_id = titles.pub_id
--ORDER BY authors.au_id ASC;


SELECT authors.au_id , authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, titleauthor.title_id, titles.pub_id FROM publication.authors
INNER JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publication.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publication.publishers ON publishers.pub_id = titles.pub_id
UNION
SELECT COUNT (publishers.pub_name) FROM publication.publishers;


