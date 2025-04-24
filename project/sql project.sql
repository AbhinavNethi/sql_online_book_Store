create database project;
use project;
show databases;

#imported the tables

#renaming the columns and adding the keys
SHOW TABLES;
alter table bookss
rename to books;
select*from books;
alter table books
change column Book_ID ID int;
select * from customers;

alter table customers
modify customer_id int primary key;
alter table customers
change column customer_id ID int;
describe customers;
select*from books;

select*from orders;
alter table orders
change column order_id id int primary key;

alter table orders
add constraint
foreign key (customer_id) references customers(id);

alter table orders
add constraint
foreign key (book_id) references books(id);

#done with adding fk and pk

select*From books;

#1 show all the books from fiction genre
select title,genre
from books 
where genre = 'fiction';

#2 find books published after year 1950
select* from books where published_year>=1950
order by published_year;

#3 list customers from canada
select*From customers;
select*from customers where country = 'Canada';

#4 show orders placed in november 2023
describe orders;
select*from orders where order_Date between '2023-11-01' and '2023-11-30';

#5 retrieve total stocks of books available
select sum(stock) from books;
select * from orders;

#6 details of most expensive book
select * from books
order by price desc
limit 1;


#7 customers who ordered more than 1 quantity of book
select c.id,o.id,name,quantity From orders as o
inner join customers as c
on o.id = c.id
where quantity>1
order by quantity;

#8 retrieve all orders where total amount exceeds 20$
select*From orders
where total_amount>20
order by total_amount;

#9 list all genres available in books 
select genre From books
group by genre;
#select distinct genre from books;

#10 find the book with lowest stock
select * from books
order by stock
limit 5;

#11 calculate total revenue generated from all orders
select sum(total_amount) from orders;

#12 retrieve total no of books sold for each genre
select genre,sum(quantity) From books as b
inner join orders as o
on o.id = b.id
group by genre;

#13 find avg price of books in fantasy genre
select avg(price),genre
From books
where genre = 'fantasy';

#14 list customers who have placed atleast 2 orders
select c.Name,count(o.id),o.customer_id
from customers as c
join orders as o
group by c.name,o.customer_id
having count(o.id)>=2;

#15 Find the most frequently ordered book
select title,book_id,count(o.id) From books as b
join orders as o
on b.id = o.id
group by title,book_id
order by count(o.id) desc;

#16 Show the top 3 most expensive books of 'Fantasy' Genre
select title, genre,price from books
where genre='fantasy'
order by price desc
limit 3;

#17 List the cities where customers who spent over $30 are located
select distinct city,total_amount from customers as c
inner join orders as o
on c.id = o.id
where total_amount>30
order by city;

#18  Retrieve the total quantity of books sold by each author
select b.author,sum(o.quantity) from books as b
inner join orders as o
on b.id = o.id
group by b.author
order by sum(o.quantity) desc;

#19 Find the customer who spent the most on orders
select c.name,c.id,sum(o.total_amount) 
from customers as c
inner join orders as o
on c.id = o.id
group by c.name,c.id
order by sum(o.total_amount)  desc;
 
 #20 Calculate the stock remaining after fulfilling all orders
 select b.title,b.id,b.stock,o.quantity,greatest(b.stock-o.quantity,0) as stock_remaining from orders as o
 inner join books as b
 on o.id = b.id
 group by b.id;