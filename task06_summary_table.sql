-- Task 6: Create Summary Table for Book Issue Count
CREATE TABLE book_issue_summary AS
SELECT issued_book_isbn AS isbn, issued_book_name AS book_title, COUNT(*) AS total_book_issued_cnt
FROM issued_status
GROUP BY issued_book_isbn, issued_book_name;
