-- Advantages of using stored procedures - Part 21

/*
    The following advantages of using Stored Procedures over adhoc queries (inline SQL)

1. Execution plan retention and reusability - Stored Procedures are compiled and 
   their execution plan is cached and used again, when the same SP is executed again. 
   Although adhoc queries also create and reuse plan, the plan is reused only when the query is 
   textual match and the datatypes are matching with the previous call. 
   Any change in the datatype or you have an extra space in the query then, 
   a new plan is created.

2. Reduces network traffic - You only need to send, EXECUTE SP_Name statement, 
   over the network, instead of the entire batch of adhoc SQL code.

3. Code reusability and better maintainability - A stored procedure can be reused with 
   multiple applications. If the logic has to change, we only have one place to change, 
   where as if it is inline sql, and if you have to use it in multiple applications, 
   we end up with multiple copies of this inline sql. If the logic has to change, 
   we have to change at all the places, which makes it harder maintaining inline sql.

4. Better Security - A database user can be granted access to an SP and prevent them from 
   executing direct "select" statements against a table.  
   This is fine grain access control which will help control what data a user has access to.
*/