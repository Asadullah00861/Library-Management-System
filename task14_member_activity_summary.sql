-- Task 14: Generate a Member Activity Report Table
CREATE TABLE member_activity_summary AS
SELECT 
    m.member_id,
    m.member_name,
    COUNT(DISTINCT i.issued_id) AS total_issued,
    COUNT(DISTINCT r.return_id) AS total_returned,
    MAX(i.issued_date) AS last_issue_date,
    RANK() OVER (ORDER BY COUNT(DISTINCT i.issued_id) DESC) AS activity_rank
FROM members AS m
LEFT JOIN issued_status AS i ON m.member_id = i.issued_member_id
LEFT JOIN return_status AS r ON i.issued_id = r.issued_id
GROUP BY m.member_id, m.member_name
ORDER BY total_issued DESC;
