UPDATE lab_mysql.Customers
SET email = 'ppicasso@gmail.com'
WHERE name = 'Pablo Picasso';

UPDATE lab_mysql.Customers
SET email = 'lincoln@us.gov'
WHERE name = 'Abraham Lincoln';

UPDATE lab_mysql.Customers
SET email = 'hello@napoleon.me'
WHERE name = 'Napoléon Bonaparte';

SELECT VIN
FROM Cars
GROUP BY VIN
HAVING COUNT(*)>1;

