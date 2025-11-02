-- Task 5: List Members Who Have Issued More Than One Book
SELECT 
    m.member_id,
    m.member_name,
    COUNT(i.issued_id) AS total_books_issued
FROM members AS m
JOIN issued_status AS i ON m.member_id = i.issued_member_id
GROUP BY m.member_id, m.member_name
HAVING COUNT(i.issued_id) > 1;
