CREATE TABLE Products (
	Id INT PRIMARY KEY,
	Name NVARCHAR(50)
);

INSERT INTO Products
VALUES
	(1, 'Yogurt'),
	(2, 'Meat'),
	(3, 'Juice'),
	(4, 'Toothpaste');

CREATE TABLE Categories (
	Id INT PRIMARY KEY,
	Name NVARCHAR(50)
);

INSERT INTO Categories
VALUES
	(1, 'Drink'),
	(2, 'Food'),
	(3, 'Breakfast');

CREATE TABLE ProductCategories (
	ProductId INT FOREIGN KEY REFERENCES Products(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	PRIMARY KEY (ProductId, CategoryId)
);

INSERT INTO ProductCategories
VALUES
	(1, 3),
	(1, 2),
	(2, 2),
	(3, 1);

SELECT P.Name, C.Name
FROM Products P
LEFT JOIN ProductCategories PC
	ON P.Id = PC.ProductId
LEFT JOIN Categories C
	ON PC.CategoryId = C.Id;