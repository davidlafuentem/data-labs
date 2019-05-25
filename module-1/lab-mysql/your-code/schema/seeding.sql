
-- I had to change the VIN number in the last row since there can't be 2 identical VIN because this colum is the primary key
INSERT INTO lab_mysql.Cars (ID,VIN,manufacturer,model,year,color) VALUES
(0,'K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
(3,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
(4,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
(5,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
(6,'DAM41UDN3CHU2WVF7','Volvo','V60 Cross Country',2019,'Gray');


-- I couldn't insert the value for the column "customer_number_ID" because I created in autoincrement mode, then I changed into a non autoincrement
INSERT INTO lab_mysql.Customers (CustomerID,customer_number,name,phone,email,address,city,state,country,zip) VALUES
(0,10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045),
(1,20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States',33130),
(2,30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);




INSERT INTO lab_mysql.Salespersons (ID,StaffID,Name,Store) VALUES
(0,00001,'Petey Cruiser','Madrid'),
(1,00002,'Anna Sthesia','Barcelona'),
(2,00003,'Paul Molive','Berlin'),
(3,00004,'Gail Forcewind','Paris'),
(4,00005,'Paige Turner','Mimia'),
(5,00006,'Bob Frapples','Mexico City'),
(6,00007,'Walter Melon','Amsterdam'),
(7,00008,'Shonda Leer','São Paulo');


INSERT INTO lab_mysql.Invoices (InvoiceID,InvoiceNumber,Date,Cars_VIN,Customer_customerID,Salespersons_staffID) VALUES
(0,852399038,'2018-08-22',0,1,3),
(1,731166526,'2018-12-31',3,0,5),
(2,271135104,'2019-01-22',2,2,7);

-- I tried to change format date without luck. I will appreciate one tip about this issue
/*
(0,852399038,DATE_FORMAT('22-08-2018','%Y %c %d'),0,1,3),
(1,731166526,DATE_FORMAT('31-12-2018','%Y %c %d'),3,0,5),
(2,271135104,DATE_FORMAT('22-01-2019','%Y %c %d'),2,2,7);
*/

