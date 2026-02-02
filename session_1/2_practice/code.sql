-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

SELECT 
    Books.title,
    Members.name,
    Loans.loan_date
FROM Loans
JOIN Books ON Loans.book_id = Books.id
JOIN Members ON Loans.member_id = Members.id;


sqlite> SELECT 
    Books.title,
    Members.name,
    Loans.loan_date
FROM Books
LEFT JOIN Loans ON Books.id = Loans.book_id
LEFT JOIN Members ON Loans.member_id = Members.id;


SELECT 
    LibraryBranch.name,
    LibraryBranch.city,
    Books.title
FROM LibraryBranch

SELECT 
    lb.name,
    lb.city,
    COUNT(b.id) AS book_count
FROM LibraryBranch lb
LEFT JOIN Books b ON lb.id = b.branch_id
GROUP BY lb.id, lb.name, lb.city
HAVING COUNT(b.id) > 7;


SELECT 
    m.name,
    COUNT(l.id) AS loan_count
FROM Members m
LEFT JOIN Loans l ON m.id = l.member_id




SELECT 
    m.name,
    m.join_date
FROM Members m
LEFT JOIN Loans l ON m.id = l.member_id
WHERE l.id IS NULL;





SELECT 
    lb.name,
    lb.city,
    COUNT(l.id) AS total_loans
FROM LibraryBranch lb
LEFT JOIN Books b ON lb.id = b.branch_id
LEFT JOIN Loans l ON b.id = l.book_id
GROUP BY lb.id, lb.name, lb.city;



SELECT DISTINCT
    m.name,
    m.join_date
FROM Members m
JOIN Loans l ON m.id = l.member_id
WHERE l.return_date IS NULL;



SELECT 
    b.title,
    b.author,
    l.loan_date,
    l.return_date,
    CASE 
        WHEN l.id IS NOT NULL THEN 'Loaned book'
        ELSE 'Unloaned book'
    END AS loan_status
FROM Books b
LEFT JOIN Loans l ON b.id = l.book_id;