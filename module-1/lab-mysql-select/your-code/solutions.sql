/*
SELECT 
authors.au_id,
authors.au_lname,
 -- CHALLANGE 1
 /*
SELECT 
authors.au_id,
authors.au_lname, 
authors.au_fname, 
titles.title, 
publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;
*/
-- CHALLENGE 2
/*
SELECT COUNT(titles.title),  
publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;
-- GROUP BY authors.au_id;
*/

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME', 
publishers.pub_name AS 'PUBLISHER',
COUNT(distinct(titles.title)) AS 'TITLE COUNT'
FROM 
publications.authors
JOIN
publications.titleauthor ON authors.au_id = titleauthor.au_id

JOIN
publications.titles ON titleauthor.title_id = titles.title_id

JOIN
publications.publishers ON publishers.pub_id = titles.pub_id

GROUP BY 
authors.au_id, publishers.pub_name
ORDER BY
COUNT(distinct(titles.title)) DESC, publishers.pub_name;
