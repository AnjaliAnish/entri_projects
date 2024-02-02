-- Create the library database
CREATE DATABASE library;

-- Use the library database
USE library;

-- 6. Books table
CREATE TABLE IF NOT EXISTS Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 1. Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 4. IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 5. ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert 5 values into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'Main Street, City1', '123-456-7890'),
(2, 102, 'Downtown, City2', '987-654-3210'),
(3, 103, 'Business District, City3', '111-222-3333'),
(4, 104, 'Central Plaza, City4', '444-555-6666'),
(5, 105, 'Shopping Mall, City5', '777-888-9999');

-- Insert 5 values into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(201, 'John Doe', 'Manager', 60000.00, 1),
(202, 'Jane Smith', 'Librarian', 45000.00, 2),
(203, 'Bob Johnson', 'Clerk', 35000.00, 3),
(204, 'Alice Brown', 'Assistant', 40000.00, 1),
(205, 'Charlie Wilson', 'Custodian', 30000.00, 4);

-- Assuming data for Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (104, 'Alice Williams', 'Manager', 62000, 2),
    (105, 'Charlie Brown', 'Clerk', 47000, 2),
    (106, 'Eva Davis', 'Clerk', 49000, 2),
    (107, 'David Lee', 'Clerk', 50000, 2),
    (108, 'Grace Miller', 'Clerk', 48000, 3),
    (109, 'Frank Wilson', 'Manager', 65000, 3),
    (110, 'Helen Clark', 'Clerk', 50000, 3),
    (111, 'George Adams', 'Clerk', 52000, 3),
    (112, 'Ivy Turner', 'Clerk', 48000, 3);

-- Insert 5 values into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(301, 'Michael Jackson', '123 Avenue, City1', '2022-01-15'),
(302, 'Emily Taylor', '456 Street, City2', '2021-11-20'),
(303, 'David Miller', '789 Road, City3', '2022-03-05'),
(304, 'Emma Davis', '101 Lane, City4', '2023-02-10'),
(305, 'Christopher Lee', '202 Boulevard, City5', '2021-09-08'),
(101, 'John Doe', '123 Main St', '2021-12-15'),
(102, 'Alice Smith', '456 Elm St', '2022-02-20'),
(103, 'Bobby Johnson', '789 Oak St', '2021-11-10'),
(201, 'Mary Johnson', '123 Pine St', '2023-01-15'),
(202, 'David White', '456 Birch St', '2022-11-20'),
(203, 'Emma Black', '789 Maple St', '2023-02-10');

-- Insert 5 values into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(1001, 'The Great Gatsby', 'Fiction', 5.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(1002, 'To Kill a Mockingbird', 'Fiction', 6.99, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1003, '1984', 'Dystopian', 7.99, 'yes', 'George Orwell', 'Secker & Warburg'),
(1004, 'Pride and Prejudice', 'Romance', 4.99, 'yes', 'Jane Austen', 'T. Egerton, Whitehall'),
(1005, 'The Catcher in the Rye', 'Coming-of-Age', 6.49, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(3001, 'World History: A Comprehensive Overview', 'History', 24.99, 'yes', 'Historian Smith', 'History Press'),
(3002, 'Ancient Civilizations: Unveiling the Past', 'History', 19.99, 'yes', 'Archaeologist Johnson', 'ArchaeoBooks'),
(2001, 'The Art of Coding', 'Programming', 15.99, 'yes', 'John Coder', 'Tech Publications'),
(2002, 'Data Science Essentials', 'Data Science', 19.99, 'yes', 'Emma Scientist', 'DataTech');

-- Insert 5 values into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401, 301, 'The Great Gatsby', '2022-02-05', 1001),
(402, 302, 'To Kill a Mockingbird', '2021-12-10', 1002),
(403, 303, '1984', '2022-04-15', 1003),
(404, 304, 'Pride and Prejudice', '2023-03-20', 1004),
(405, 305, 'The Catcher in the Rye', '2022-10-18', 1005);
   
-- Insert 5 values into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(501, 301, 'The Great Gatsby', '2022-02-20', 1001),
(502, 302, 'To Kill a Mockingbird', '2022-01-15', 1002),
(503, 303, '1984', '2022-05-01', 1003),
(504, 304, 'Pride and Prejudice', '2023-04-02', 1004),
(505, 305, 'The Catcher in the Rye', '2022-11-30', 1005);

-- Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';

-- List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, i.Issued_cust, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Display the total count of books in each category.
SELECT Category, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issued_cust IS NULL;

-- Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no;

-- Display the names of customers who have issued books in the month of June 2023.
SELECT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;
    
-- Retrieve book_title from book table containing history. 
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no
HAVING TotalEmployees > 5;

-- 		* END OF MySQL MODULE *