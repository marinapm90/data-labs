SELECT authors.au_id , authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, titleauthor.title_id,  titles.pub_id FROM publication.authors
INNER JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publication.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publication.publishers ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id ASC;


SELECT authors.au_id , authors.au_lname, authors.au_fname, publishers.pub_name, titles.title, titleauthor.title_id, titles.pub_id, COUNT (titles.title) AS "number of titles" FROM publication.authors
INNER JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publication.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publication.publishers ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.title_id, authors.au_fname
ORDER BY authors.au_id ASC;

