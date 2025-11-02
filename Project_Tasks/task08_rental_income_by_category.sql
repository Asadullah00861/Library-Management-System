-- Task 8: Find Total Rental Income by Category (sorted by Highest)
SELECT category, SUM(rental_price) AS total_income
FROM books AS b
JOIN issued_status AS i ON b.isbn = i.issued_book_isbn
GROUP BY category
ORDER BY total_income DESC;
