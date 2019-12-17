/*
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
SELECT 
authors.au_id,
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'NAME', 
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title)
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id,publishers.pub_name
ORDER BY COUNT(titles.title) DESC;


*/
-- CHALLENGE3
/*
SELECT
authors.au_id AS 'AUTHOR ID',
COUNT(titles.title_id) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY COUNT(titles.title_id) DESC LIMIT 3;



*/
-- CHALLENGE4
/*
SELECT
authors.au_id AS 'AUTHOR ID',
COUNT(titles.title_id) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY COUNT(titles.title_id) DESC;


*/
-- Bonus Challenge
/*
SELECT   authors.au_id AS 'AUTHOR ID',authors.au_lname AS 'LAST NAME',authors.au_fname AS 'FIRST NAME', 
CASE  
	WHEN titleauthor.royaltyper < 100 THEN SUM((titles.price*titleauthor.royaltyper*sales.qty)+(titles.advance*titleauthor.royaltyper))
	WHEN titleaUthor.royaltyper = 100 THEN SUM((titles.price*titles.royalty*sales.qty)+(titles.advance))
END 'PROFIT' 
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id, titleauthor.royaltyper,'PROFIT' 
ORDER BY 'PROFIT' DESC; 
