create database AssignmentDb
use AssignmentDb

CREATE TABLE Publisher (
    PID INT PRIMARY KEY,
    PublisherName VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Category (
    CID INT PRIMARY KEY,
    CategoryName VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Author (
    AID INT PRIMARY KEY,
    AuthorName VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Book (
    BID INT PRIMARY KEY NOT NULL,
    BName VARCHAR(255) NOT NULL,
    BPrice DECIMAL(10, 2),
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CID)
)

-- Insert data into Category
INSERT INTO Category (CID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Mystery')

-- Insert data into Author
INSERT INTO Author (AID, AuthorName) VALUES
(1, 'J.K. Rowling'),
(2, 'Isaac Asimov'),
(3, 'Agatha Christie')

-- Insert data into Publisher
INSERT INTO Publisher (PID, PublisherName) VALUES 
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Simon & Schuster')

-- Insert data into Book
INSERT INTO Book (BID, BName, BPrice, AuthorID, PublisherID, CategoryID) VALUES
(1, 'Harry Potter and the Sorcerer''s Stone', 19.99, 1, 1, 1),
(2, 'Born a Crime', 21.99, 2, 2, 2),
(3, 'The Great Gatsby', 14.99, 3, 3, 3),
(4, 'Harry Potter and the Chamber of Secrets', 19.99, 1, 1, 1),
(5, 'The Lord of Rings', 18.99, 2, 2, 2),
(6, 'The Alchemist', 15.99, 3, 3, 3)

-- Retrieve book details
SELECT BID, BName, BPrice, AuthorName, PublisherName, CategoryName
FROM Book
INNER JOIN Author ON Book.AuthorID = Author.AID
INNER JOIN Publisher ON Book.PublisherID = Publisher.PID
INNER JOIN Category ON Book.CategoryID = Category.CID