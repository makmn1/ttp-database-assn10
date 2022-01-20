-- step-1 --> create a database 
-- create database Ecommerce;
-- CREATE DATABASE test11;
-- SELECT
--     *
-- from
--     test1;
-- step2 --> user table
DROP TABLE users,
CartHistory,
Cart,
product;

CREATE TABLE Users (
    userId INT PRIMARY KEY,
    userName varchar(50) NOT NULL UNIQUE,
    LastName varchar(30) NOT NULL,
    FirstName varchar(30) NOT NULL,
    email varchar(250) NOT NULL UNIQUE,
    telephone varchar(30),
    homeAddress varchar(30) NOT NULL,
    isMember boolean NOT NULL,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    Users (
        userId,
        userName,
        LastName,
        FirstName,
        email,
        telephone,
        homeAddress,
        isMember
    )
VALUES
    (
        1,
        'AseelABdo23',
        'Alshohatee',
        'Aseel',
        'AseelAlshohatee@gmail.com',
        '0123456789',
        'ave',
        true
    );

INSERT INTO
    Users (
        userId,
        userName,
        LastName,
        FirstName,
        email,
        telephone,
        homeAddress,
        isMember
    )
VALUES
    (
        2,
        'AliAbdo3',
        'Alshohatee',
        'Ali',
        'AliAlshohatee@gmail.com',
        '0123456789',
        'ave',
        true
    );

-- step3 --> CartHistory table
-- DROP TABLE CartHistory;
CREATE TABLE CartHistory (
    cartID INT PRIMARY KEY,
    userID INT,
    quantity int,
    promoCodeUsed varchar(16),
    checkoutTime date,
    shipping int,
    FOREIGN KEY(userID) REFERENCES Users(userID)
);

INSERT INTO
    CartHistory (
        cartID,
        userID,
        quantity,
        promoCodeUsed,
        checkoutTime,
        shipping
    )
VALUES
    (1, 1, 20, 'FREEFIVE', '1/1/2022', 4.99);

INSERT INTO
    CartHistory (
        cartID,
        userID,
        quantity,
        promoCodeUsed,
        checkoutTime,
        shipping
    )
VALUES
    (2, 2, 15, 'dfnksa', '1/1/2022', 5.99);

-- step4 --> product table
-- DROP TABLE product;
CREATE TABLE product (
    productID INT PRIMARY KEY,
    productName varchar(50),
    Price FLOAT NOT NULL,
    prodDescription TEXT NOT NULL,
    brand varchar(25),
    model varchar(25),
    SKU varchar(8),
    saleModifier int,
    productWeight FLOAT NOT NULL,
    Width FLOAT NOT NULL,
    Height FLOAT NOT NULL,
    inStock boolean
);

INSERT INTO
    product (
        productID,
        productName,
        Price,
        prodDescription,
        brand,
        model,
        SKU,
        saleModifier,
        productWeight,
        Width,
        Height,
        inStock
    )
VALUES
(
        1,
        'shirt',
        5.99,
        'shirt men',
        'Tommy',
        '2021 ',
        '33403123',
        1,
        5,
        2,
        4,
        true
    );

INSERT INTO
    product (
        productID,
        productName,
        Price,
        prodDescription,
        brand,
        model,
        SKU,
        saleModifier,
        productWeight,
        Width,
        Height,
        inStock
    )
VALUES
(
        2,
        'pant',
        7.99,
        'pant men',
        'Tommy',
        '2021 ',
        '3243242',
        1,
        1,
        30,
        30,
        true
    );

-- step5 --> Cart table
-- DROP TABLE Cart;
CREATE TABLE Cart (
    productID INT,
    cartItemID INT,
    cartID INT PRIMARY KEY,
    dateAdded date,
    dateRemoved date,
    purchased boolean,
    FOREIGN KEY(cartID) REFERENCES CartHistory(cartID),
    FOREIGN KEY(productID) REFERENCES product(productID)
);

INSERT INTO
    Cart(
        productID,
        cartItemID,
        cartID,
        dateAdded,
        dateRemoved,
        purchased
    )
VALUES
    (1, 1, 1, '1 / 12 / 2022', '1 / 12 / 2022', true);

INSERT INTO
    Cart(
        productID,
        cartItemID,
        cartID,
        dateAdded,
        dateRemoved,
        purchased
    )
VALUES
    (2, 2, 2, '1 / 12 / 2022', '1 / 12 / 2022', true);