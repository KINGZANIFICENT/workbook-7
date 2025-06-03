1. What is the name of the table that holds the items Northwind sells?
-Products

--------------------------------------------------------------------------------

2. Write a query to list the product id, product name, and unit price of every
product.
-SELECT productid,productname,unitprice FROM products;


SELECT product_id, product_name, unit_price
FROM products;


--------------------------------------------------------------------------------

3. Write a query to list the product id, product name, and unit price of every
product. Except this time, order then in ascending order by price.

-SELECT productid,productname,unitprice FROM products ORDER BY unitprice ASC;

--------------------------------------------------------------------------------

4. What are the products that we carry where the unit price is $7.50 or less?

'13', 'Konbu', '6.0000'
'24', 'Guaran Fantstica', '4.5000'
'33', 'Geitost', '2.5000'
'52', 'Filo Mix', '7.0000'
'54', 'Tourtire', '7.4500'

SELECT productid, productname, unitprice
FROM northwind.products
WHERE unit_price <= 7.50;


--------------------------------------------------------------------------------
5. What are the products that we carry where we have at least 100 units on
hand? Order them in descending order by price.

'61', 'Sirop d\'rable', '28.5000', '113'
'6', 'Grandma\'s Boysenberry Spread', '25.0000', '120'
'55', 'Pt chinois', '24.0000', '115'
'22', 'Gustaf\'s Knckebrd', '21.0000', '104'
'36', 'Inlagd Sill', '19.0000', '112'
'40', 'Boston Crab Meat', '18.4000', '123'
'73', 'Rd Kaviar', '15.0000', '101'
'34', 'Sasquatch Ale', '14.0000', '111'
'75', 'Rhnbru Klosterbier', '7.7500', '125'
'33', 'Geitost', '2.5000', '112'


SELECT productid, productname, unitprice, unitsinstock
FROM northwind.products
WHERE unitsinstock >= 100
ORDER BY unitprice DESC;



---------------------------------------------------------------------------------
6. What are the products that we carry where we have at least 100 units on
hand? Order them in descending order by price. If two or more have the
same price, list those in ascending order by product name.

Sirop d'rable
Grandma's Boysenberry Spread
Pt chinois
Gustaf's Knckebrd
Inlagd Sill
Boston Crab Meat
Rd Kaviar
Sasquatch Ale
Rhnbru Klosterbier
Geitost


SELECT productid, productname, unitprice, unitsinstock
FROM northwind.products
WHERE unitsinstock >= 100
ORDER BY unitprice DESC, productname ASC;


---------------------------------------------------------------------------------

7. What are the products that we carry where we have no units on hand, but 1
or more units of them on backorder? Order them by product name.

'31', 'Gorgonzola Telino', '12.5000', '0', '70'

SELECT productid, productname, unitprice, unitsinstock, unitsonorder
FROM northwind.products
WHERE unitsinstock = 0 AND unitsonorder > 0
ORDER BY productname ASC;


---------------------------------------------------------------------------------

8. What is the name of the table that holds the types (categories) of the items
Northwind sells?

-categories


---------------------------------------------------------------------------------

9. Write a query that lists all of the columns and all of the rows of the
categories table? What is the category id of seafood?

category id = 8

SELECT *
FROM northwind.categories
WHERE categoryname = 'Seafood';


---------------------------------------------------------------------------------

10. Examine the Products table. How does it identify the type (category) of
each item sold? Write a query to list all of the seafood items we carry.

SELECT p.productid, p.productname, p.unitprice, p.unitsinstock
FROM northwind.products p
JOIN northwind.categories c ON p.categoryid = c.categoryid
WHERE c.categoryname = 'Seafood';


---------------------------------------------------------------------------------
11. What are the first and last names of all of the Northwind employees?

Nancy	Davolio
Andrew	Fuller
Janet	Leverling
Margaret	Peacock
Steven	Buchanan
Michael	Suyama
Robert	King
Laura	Callahan
Anne	Dodsworth

SELECT firstname, lastname
FROM northwind.employees;


---------------------------------------------------------------------------------

12. What employees have "manager" in their titles?

-Steven	Buchanan	Sales Manager


SELECT firstname, lastname, title
FROM northwind.employees
WHERE LOWER(title) LIKE '%manager%'




---------------------------------------------------------------------------------
13. List the distinct job titles in employees.

Sales Representative
Vice President, Sales
Sales Manager
Inside Sales Coordinator

SELECT DISTINCT title
FROM northwind.employees;


---------------------------------------------------------------------------------
14. What employees have a salary that is between $200 0 and $2500?

Andrew	Fuller	2254.49
Michael	Suyama	2004.07
Laura	Callahan	2100.5
Anne	Dodsworth	2333.33

SELECT firstname, lastname, salary
FROM northwind.employees
WHERE salary BETWEEN 2000 AND 2500;

---------------------------------------------------------------------------------
15. List all of the information about all of Northwind's suppliers.

'1', 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL
'2', 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#'
'3', 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL
'4', 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai\nMusashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL
'5', 'Cooperativa de Quesos \'Las Cabras\'', 'Antonio del Valle Saavedra ', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL
'6', 'Mayumi\'s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko\nChuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi\'s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#'
'7', 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St.\nMoonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL
'8', 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King\'s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL
'9', 'PB Knckebrd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Gteborg', NULL, 'S-345 67', 'Sweden ', '031-987 65 43', '031-987 65 91', NULL
'10', 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'So Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL
'11', 'Heli Swaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstrae 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL
'12', 'Plutzer Lebensmittelgromrkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#'
'13', 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL
'14', 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#'
'15', 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL
'16', 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue\nSuite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL
'17', 'Svensk Sjfda AB', 'Michael Bjrn', 'Sales Representative', 'Brovallavgen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL
'18', 'Aux joyeux ecclsiastiques', 'Guylne Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL
'19', 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept.\n2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL
'20', 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL
'21', 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild\nFiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL
'22', 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop\nRijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL
'23', 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL
'24', 'G\'day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade\nHunter\'s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G\'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#'
'25', 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL
'26', 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL
'27', 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL
'28', 'Gai pturage', 'Eliane Noz', 'Sales Representative', 'Bat. B\n3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL
'29', 'Forts d\'rables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Qubec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL

SELECT *
FROM northwind.suppliers;



---------------------------------------------------------------------------------
16. Examine the Products table. How do you know what supplier supplies
each product? Write a query to list all of the items that "Tokyo Traders"
supplies to Northwind

'9', 'Mishi Kobe Niku', '97.0000', '29'
'10', 'Ikura', '31.0000', '31'
'74', 'Longlife Tofu', '10.0000', '4'


SELECT p.productid, p.productname, p.unitprice, p.unitsinstock
FROM northwind.products p
JOIN northwind.suppliers s ON p.supplierid = s.supplierid
WHERE s.companyname = 'Tokyo Traders';

