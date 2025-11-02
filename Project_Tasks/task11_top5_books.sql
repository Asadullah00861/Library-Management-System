-- Task 11: Find the Most Popular Books (Top 5 by Issue Count)
SELECT 
    b.book_title,
    COUNT(i.issued_id) AS total_issued
FROM books AS b
JOIN issued_status AS i ON b.isbn = i.issued_book_isbn
GROUP BY b.book_title
ORDER BY total_issued DESC
LIMIT 5;
