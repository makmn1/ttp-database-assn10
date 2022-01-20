-- postgres=# CREATE DATABASE Assignment10
-- postgres-# ;
-- CREATE DATABASE
-- postgres=# \c assignment10

CREATE SCHEMA ECommerce;
CREATE TABLE Users (
   userID INT PRIMARY KEY,
   userName varchar(50),
   gender   char(5)  NULL,
   email    varchar(250),
   isMember boolean
);

INSERT INTO Users (userID, userName, gender,email,isMember)
VALUES (1,'Steph','F','steph@gmail.com',true);
INSERT INTO Users (userID, userName, gender,email,isMember)
VALUES (2,'Andrew','M','andrew@gmail.com',false);
INSERT INTO Users (userID, userName, gender,email,isMember)
VALUES (3,'Aarfa','F','aarfa@gmail.com',true);
INSERT INTO Users (userID, userName, gender,email,isMember)
VALUES (4,'Bob','M','bob@gmail.com',true);

-- assignment10=# SELECT * FROM Users;
--  userid | username | gender |      email       | ismember 
-- --------+----------+--------+------------------+----------
--       1 | Steph    | F      | steph@gmail.com  | t
--       2 | Andrew   | M      | andrew@gmail.com | f
--       3 | Aarfa    | F      | aarfa@gmail.com  | t
--       4 | Bob      | M      | bob@gmail.com    | t
-- (4 rows)

CREATE TABLE Cart(
   productID INT PRIMARY KEY,
   cartItemID INT,
   cartID INT,
   dateAdded date,
   dateRemoved date,
   purchased boolean
);

INSERT INTO Cart(cartItemID,cartID,productID,dateAdded,dateRemoved,purchased)
VALUES(1,2,1,'1/2/2012','2/12/2021',true);
INSERT INTO Cart(cartItemID,cartID,productID,dateAdded,dateRemoved,purchased)
VALUES(2,3,2,'11/2/2020','2/12/2021',true);
INSERT INTO Cart(cartItemID,cartID,productID,dateAdded,dateRemoved,purchased)
VALUES(3,2,3,'10/2/2012','12/12/2021',false);
INSERT INTO Cart(cartItemID,cartID,productID,dateAdded,dateRemoved,purchased)
VALUES(4,1,4,'1/2/2012','2/12/2021',false);

-- assignment10=# SELECT * FROM Cart;
--  productid | cartitemid | cartid | dateadded  | dateremoved | purchased 
-- -----------+------------+--------+------------+-------------+-----------
--          1 |          1 |      2 | 2012-01-02 | 2021-02-12  | t
--          2 |          2 |      3 | 2020-11-02 | 2021-02-12  | t
--          3 |          3 |      2 | 2012-10-02 | 2021-12-12  | f
--          4 |          4 |      1 | 2012-01-02 | 2021-02-12  | f
-- (4 rows)



CREATE TABLE CartHistory (
   cartID INT PRIMARY KEY,
   userID INT,
   quantity int,
   promoCodeUsed varchar(16),
   checkoutTime date,
   shipping int
);

INSERT INTO CartHistory(cartID,userID,quantity,promoCodeUsed,checkoutTime,shipping)
VALUES(1,2,4,'FREEFIVE','1/12/2022',5.99);
INSERT INTO CartHistory(cartID,userID,quantity,promoCodeUsed,checkoutTime,shipping)
VALUES(2,1,54,'FREESHIP','12/12/2020',8.99);
INSERT INTO CartHistory(cartID,userID,quantity,promoCodeUsed,checkoutTime,shipping)
VALUES(3, 3, 5, '20OFF','10/31/2021',4.99);
INSERT INTO CartHistory(cartID,userID,quantity,promoCodeUsed,checkoutTime,shipping)
VALUES(4, 4, 1, 'LOVEISLOVE','10/31/2011',4.99);

-- assignment10=# SELECT * FROM CartHistory;
--  cartid | userid | quantity | promocodeused | checkouttime | shipping 
-- --------+--------+----------+---------------+--------------+----------
--       1 |      2 |        4 | FREEFIVE      | 2022-01-12   |        6
--       2 |      1 |       54 | FREESHIP      | 2020-12-12   |        9
--       3 |      3 |        5 |               | 2021-10-31   |        5
--       4 |      4 |        1 | LOVEISLOVE    | 2011-10-31   |        5
-- (4 rows)

CREATE TABLE ProductInfo(
   productID INT PRIMARY KEY,
   productName varchar(50),
   brand varchar(25),
   model varchar(25),
   SKU varchar(8),
   saleModifier int,
   retailPrice int,
   inStock boolean
);

INSERT INTO ProductInfo(productID,productName,brand,model,SKU,saleModifier,retailPrice,inStock)
VALUES(1,'shirt','Tommy','','33403123',1,12.99, true);
INSERT INTO ProductInfo(productID,productName,brand,model,SKU,saleModifier,retailPrice,inStock)
VALUES(2,'pants','Tommy','','123425',2,42.99, false);
INSERT INTO ProductInfo(productID,productName,brand,model,SKU,saleModifier,retailPrice,inStock)
VALUES(3,'beanie','Gucci','','',3,5.99, true);
INSERT INTO ProductInfo(productID,productName,brand,model,SKU,saleModifier,retailPrice,inStock)
VALUES(4,'scarf','Karen Scott','','',4,12.99, true);

-- assignment10=# SELECT * FROM ProductInfo;
--  productid | productname |    brand    | model |   sku    | salemodifier | retailprice | instock 
-- -----------+-------------+-------------+-------+----------+--------------+-------------+---------
--          1 | shirt       | Tommy       |       | 33403123 |            1 |          13 | t
--          2 | pants       | Tommy       |       | 123425   |            2 |          43 | f
--          3 | beanie      | Gucci       |       |          |            3 |           6 | t
--          4 | scarf       | Karen Scott |       |          |            4 |          13 | t
-- (4 rows)

