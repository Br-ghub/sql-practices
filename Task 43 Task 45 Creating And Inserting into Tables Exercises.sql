-- ============================================================
-- MySQL Practice Worksheet 
-- Focus: tables, columns, data types, creating/renaming/dropping, and basic inserts.
-- Task 43: Create a database table
-- Task 45: Insert a row in a database table
-- ============================================================

/* 0) Setup: Work in a safe sandbox database.
   - Create a database named learning_lab (if it doesn't exist) and switch to it.
*/
-- Answer
create database if not exists learning_lab;
use learning_lab;

/* 1) Discover tables.
   - Show all tables in the current database.
*/
-- Answer
show tables in learning_lab;

/* 2) Create a table.
   - Create a table named `campers` with the following columns:
     camper_id (INT), first_name (VARCHAR 40), last_name (VARCHAR 40),
     daily_rate (DECIMAL with 2 decimals), start_date (DATE).
*/
-- Answer
drop table if exists campers;
create table if not exists campers(
camper_id INT primary key,
first_name VARCHAR(40),
last_name VARCHAR(40),
daily_rate decimal(5,2),
start_date date
);

/* 3) View your table.
   - Return all columns/rows from `campers`.
*/
-- Answer
select * from campers;

/* 4) Add a column.
   - Add a column named contact_email (VARCHAR 80) to `campers`.
*/
-- Answer
alter table campers
add contact_email VARCHAR (80);
select * from campers;

/* 5) Rename a column.
   - Rename contact_email to email.
*/
-- Answer
alter table campers
rename column contact_email to email; -- WHY DIDN'T THIS WORK THE FIRST TIME? I DIDN'T CHANGE ANYTHING. THIS IS THE EXACT SAME, AND NOW YOU'RE HAPPY????
select * from campers; -- CHANGE THE NAME. PLEEEEEEEEEEEEEEEEEEEEEEASE

/* 6) Change a column's type.
   - Increase email length to VARCHAR 120.
*/
-- Answer
alter table campers
modify column email VARCHAR (120);
select * from campers;

/* 7) Move a column (position change).
   - Move email so it appears after last_name.
*/
-- Answer
alter table campers
modify column email VARCHAR (120)
after last_name;
select * from campers;

/* 8) Move a column to first position.
   - Make email the first column.
*/
-- Answer
-- but we just moved it???
alter table campers
modify column email VARCHAR (120)
first;

/* 9) Delete a column.
   - Remove the email column.
*/
-- Answer
-- Why'd we make it then?
alter table campers
drop column email;

/* 10) Rename a table.
   - Rename campers to participants.
   -- Answer (remove before sharing):
*/
-- Answer
rename table campers to participants;

/* 11) Rename it back.
   - Rename participants back to campers.
*/
-- Answer
rename table participants to campers;

/* 12) Insert one row.
   - Insert a single camper: (101, 'Alex', 'Rivera', 89.50, '2025-06-09').
*/
-- Answer
-- WHY DOES THIS BREAK IT?????? alter table campers
-- I'M ABOUT TO EXPLODEMFKHDSKJFHSDFKJGHSJKDHFHSDHFJHSGHFDJFGKJHFGJKSGFJHGDFHBDFghzjKGHJ
insert into campers values (101, "Alex", "Rivera", 89.50, "2025-6-9");

/* 13) Insert multiple rows.
   - Insert four more rows with DIFFERENT data than any samples shown earlier in class.
     Example values (you may adjust dates/rates):
       (102, 'Priya',  'Shah',    95.00, '2025-06-10')
       (103, 'Jordan', 'Lee',     72.25, '2025-06-11')
       (104, 'Mateo',  'Garcia',  80.00, '2025-06-11')
       (105, 'Sakura', 'Tanaka',  99.99, '2025-06-12')
*/
-- Answer
insert into campers values
(102, 'Priya',  'Shah',    95.00, '2025-06-10'),
(103, 'Jordan', 'Lee',     72.25, '2025-06-11'),
(104, 'Mateo',  'Garcia',  80.00, '2025-06-11'),
(105, 'Sakura', 'Tanaka',  99.99, '2025-06-12');

/* 14) Insert with specific columns only.
   - Insert a row with ONLY camper_id, first_name, last_name (leave others NULL):
*/
insert into campers values (106, "Logan", "Ul", NULL, NULL);

/* 15) Verify.
   - Show all rows currently in the campers table.
*/
-- Answer
select * from campers;

/* 16) Practice handling mistakes.
   - Try an insert that should FAIL because of a column/value count mismatch,
     then fix it by explicitly listing the column names.
*/
-- Answer
-- Bad Attempt:
-- insert into campers values (107, "rats");
-- Good Attempt:
insert into campers (first_name, last_name, camper_id)
values ("Rats", "Cheese", 107);
select * from campers;

/* 17) Drop a table.
   - Delete the campers table entirely.
*/
-- Answer
drop table campers;
-- End of Exercises
