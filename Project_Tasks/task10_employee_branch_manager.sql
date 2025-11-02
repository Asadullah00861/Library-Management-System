-- Task 10: List Employees with Their Branch Manager's Name and Branch Details
SELECT 
    e.emp_id,
    e.emp_name AS employee_name,
    e.position,
    b.branch_id,
    b.branch_address,
    b.contact_no,
    m.emp_name AS manager_name
FROM employees AS e
JOIN branch AS b ON e.branch_id = b.branch_id
JOIN employees AS m ON b.manager_id = m.emp_id;
