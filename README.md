# SQL Online Book Store Project

This project simulates a small online book store using SQL. It involves creating and managing a database with tables such as `books`, `customers`, and `orders`.

## Database Structure

### Tables:
- **books**: Contains information about each book, including title, author, price, genre, stock, and publication year.
- **customers**: Contains customer details such as name, email, country, and city.
- **orders**: Represents purchase transactions, including quantities and total amounts.

### Relationships:
- `orders.customer_id` → `customers.id`
- `orders.book_id` → `books.id`



