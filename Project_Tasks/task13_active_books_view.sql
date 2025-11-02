-- Task 13: Create a View for Active Book Inventory
CREATE OR REPLACE VIEW active_books AS
SELECT isbn, book_title, category, rental_price, author, publisher
FROM books
WHERE status = 'yes';
