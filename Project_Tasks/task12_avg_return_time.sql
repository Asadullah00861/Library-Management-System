-- Task 12: Find Average Return Time per Book
SELECT 
    b.book_title,
    ROUND(AVG(r.return_date - i.issued_date), 2) AS avg_days_to_return
FROM books AS b
JOIN issued_status AS i ON b.isbn = i.issued_book_isbn
JOIN return_status AS r ON i.issued_id = r.issued_id
GROUP BY b.book_title
ORDER BY avg_days_to_return;
