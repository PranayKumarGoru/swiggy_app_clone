CREATE TABLE Users (
    UserId varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),
    Address varchar(255),
    AddressType varchar(255)
);

INSERT INTO Users (UserId, Password, Name, Email, Phone, Address, AddressType)  
   VALUES ('admin', 'admin', 'TestUser', 'testuser@relevel.com', '7777000055', 'Plot No: 45, Somajiguda, Hyderabad-500032', 'Home');

INSERT INTO Users (UserId, Password, Name, Email, Phone, Address, AddressType)  
   VALUES ('prakhar.g', 'swiggyP', 'Prakhar G', 'prakhar.g@relevel.com', '8745697845', 'Plot No: 74, Kukatpally, Hyderabad-500952', 'Home');
   
   
CREATE TABLE Restaurant (
    RestaurantId INTEGER PRIMARY KEY,
    RestaurantName varchar(255),
    Address varchar(255),
    City varchar(255)
);


INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (001, 'Green Bawarchi', 'Y junction Kukatpally', 'Hyderabad');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (002, 'Hitex Bawarchi', 'Main road Beeramguda', 'Hyderabad');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (003, 'Bawarchi', 'RTC Crossroads, Ashoknagar', 'Hyderabad');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (004, 'Delhi Highway', '105 Mistry Mansion Ground Floor Mahatma Gandhi Road Kala Ghoda', 'Mumbai');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (005, 'Manuhaar- The Taste of Tradition', 'Hotel Sahara Star, Opp Domestic Airport', 'Mumbai');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (006, 'Kebabs & Kurries', '287 Dr B R Ambedkar Road ITC Grand Central Hotel', 'Mumbai');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (007, 'HOP House OF Proteins', 'Malviya Nagar SHOP NO 33 Corner Market', 'New Delhi');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (008, 'Daryaganj Restaurant (Connaught Place)', 'Shop No. 11 Regal Building Connaught Place', 'New Delhi');
INSERT INTO Restaurant (RestaurantId, RestaurantName, Address, City)  
   VALUES (009, 'CIA Call it Asiian', '16 Alaknanda Rd. Opposite Don Bosco School, Narmada Shopping Complex', 'New Delhi');

   
CREATE TABLE Items (
    ItemId INTEGER PRIMARY KEY,
    RestaurantId INTEGER references Restaurant(RestaurantId),
    DishName varchar(255),
    Price DECIMAL
);   


INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (447756,001,'Veg Pulao',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (669785,001,'Chicken Birayani',300);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (552354,001,'Mutton Birayani',400);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (884524,001,'Butter Chicken',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (885697,001,'Romali Roti',10);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (221458,002,'Fish Curry',340.56);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (998745,002,'Chicken Kolapuri',320.24);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (114587,002,'Mutton zafrani',480);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (887744,002,'Egg Birayani',375);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (998874,002,'Romali Roti',30);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (996632,006,'Veg Pulao',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (774158,006,'Chicken Tikka',220);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (963214,006,'Chilli Chicken',240);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (852364,006,'Paneer Butter Masala',250);
INSERT INTO Items (ItemId, RestaurantId, DishName, Price)  
   VALUES (951236,006,'Butter Nan',35);
   

CREATE TABLE OrderDetails (
    OrderId INTEGER PRIMARY KEY AUTO_INCREMENT,
    RestaurantId INTEGER references Restaurant(RestaurantId),
    UserId varchar(255) references Users(UserId),
    DeliveryBoyName varchar(255),
    DeliveryBoyMobile varchar(255),
    OrderStatus varchar(255),
    rating decimal
);

INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus, rating)  
   VALUES (001, 'prakhar.g', 'Ramesh', '7784455677', 'Completed', 5);
INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus, rating)  
   VALUES (001, 'prakhar.g', 'Rahul', '8745147685', 'Completed', 4.2);
INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus, rating)  
   VALUES (006, 'prakhar.g', 'Suresh', '7784454477', 'Completed', 3.8);
INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus, rating)  
   VALUES (002, 'admin', 'Sukesh', '847451475', 'Completed', 3.2);

INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus)  
   VALUES (001, 'admin', 'Ramesh', '7784455677', 'Out For Delivery');
INSERT INTO OrderDetails (RestaurantId, UserId, OrderStatus)  
   VALUES (001, 'admin', 'Ordered');
INSERT INTO OrderDetails (RestaurantId, UserId, DeliveryBoyName, DeliveryBoyMobile, OrderStatus)  
   VALUES (006, 'admin', 'Suresh', '7784454477', 'Out For Delivery');
INSERT INTO OrderDetails (RestaurantId, UserId, OrderStatus)  
   VALUES (002, 'admin', 'Processing');

   

   

CREATE TABLE InOrderItems (
    InOrderId INTEGER AUTO_INCREMENT PRIMARY KEY,
    OrderId INTEGER references OrderDetails(OrderId),
    ItemId INTEGER references Items(ItemId),
    Quantity INTEGER
);


INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (5, 447756, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (5, 884524, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (6, 552354, 2);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (7, 774158, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (7, 963214, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (8, 998745, 1);
   
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (1, 447756, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (1, 884524, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (3, 963214, 2);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (4, 774158, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (4, 963214, 1);
INSERT INTO InOrderItems (OrderId, ItemId, Quantity)  
   VALUES (2, 552354, 1);







