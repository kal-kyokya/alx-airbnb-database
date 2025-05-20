# Implement Indexes for Optimization

## Objective

Identify and create indexes to improve query performance.

## Instructions

* Identify high-usage columns in ```User```, ```Booking```, and ```Property``` tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
* Write SQL ```CREATE INDEX``` commands to create appropriate indexes for those columns and save them in <a href="https://github.com/kal-kyokya/alx-airbnb-database/blob/main/database-adv-script/database_index.sql" target="_blank">```database_index.sql```</a>.
* Measure the query performance before and after adding indexes using ```EXPLAIN``` or ```ANALYZE```.