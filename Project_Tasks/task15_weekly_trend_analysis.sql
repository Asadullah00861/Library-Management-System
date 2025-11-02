-- Task 15: Dynamic Weekly Book Issue Trend Analysis
CREATE OR REPLACE VIEW book_issue_trend AS
SELECT
    b.book_title,
    DATE_TRUNC('week', i.issued_date)::date AS issue_week,
    COUNT(i.issued_id) AS total_issued,
    LAG(COUNT(i.issued_id)) OVER (
        PARTITION BY b.book_title
        ORDER BY DATE_TRUNC('week', i.issued_date)
    ) AS prev_week_issued,
    (COUNT(i.issued_id) - COALESCE(LAG(COUNT(i.issued_id)) OVER (
         PARTITION BY b.book_title
         ORDER BY DATE_TRUNC('week', i.issued_date)
     ), 0)) AS change_from_prev_week
FROM issued_status AS i
JOIN books AS b ON i.issued_book_isbn = b.isbn
WHERE i.issued_date IS NOT NULL
GROUP BY b.book_title, DATE_TRUNC('week', i.issued_date)
ORDER BY b.book_title, issue_week;
