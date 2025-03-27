

# Interacting with Databases in FiveM

> ### Connection String

`"mysql://your_username:your_password@your_server_ip/your_database?charset=utf8mb4"`



# Useful `oxmysql` functions

## MySQL.Async.fetchScalar
```
Purpose:
Retrieves a single value (a scalar) from the database.
When to Use:
Ideal for queries where you need only one piece of data (e.g., a count, a single configuration value).

Benefits:

Efficiency: Only returns one value, minimizing overhead.

Simplicity: No need to iterate over rows; you get the result directly.

Clarity: Makes your code cleaner when you only need one value.


SELECT inventory FROM users WHERE userid = '10';
```

## MySQL.Async.fetchAll()

```
Purpose:
Retrieves all rows returned by a query.

When to Use:
Use it when you expect multiple rows of data (e.g., fetching a list of users, items, or records).

Benefits:

Comprehensive Data: Returns an array (Lua table) containing all rows.

Flexibility: Lets you loop over each row to process or display data.

Ideal for List Displays: Perfect when building interfaces that need to show lists of items.

SELECT * FROM users;

```


## MySQL.Async.execute

```
Purpose:
Executes a query that **modifies** data (e.g., INSERT, UPDATE, DELETE).

When to Use:
Use it for write operations where you need to change the database’s contents.

Benefits:

Feedback on Changes: Returns the number of rows affected, so you know the impact of your query.


Prevents Data Retrieval Overhead: Since it’s not used for fetching data, it’s optimized for database modifications.

Safety: Supports parameterized queries to reduce SQL injection risks.
```

> ## Extra

```
Error Handling:
Each function takes a callback where you can handle errors gracefully.  **Always** check for errors in callbacks.

Performance:
Use the simplest function that meets your needs. If you only need one value, don’t use fetchAll because it retrieves more data than necessary.

Readability:
Clear separation between functions that read data (fetchScalar, fetchAll) and those that write data (execute) makes the code easier to follow.
```


# Lua x JS communication

> ### Channel

```
Lua and JavaScript communicate through HTTP, what is HTTP?

Hyper-Text Transfer Protocol (Secure)

```
[HTTP Documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP)
```

TCP Protocol

-- Sends packets directly to the server and awaits confirmation of receival, through handshakes


UDP Protocol

-- Send multiple instances of the same packet without awaiting confirmation

HTTP Protocols:

POST -- Sending information to a server (execute from mysql) body: {} | | Content-Type: 'application/json'

GET -- Fetching information from a server (fetchAll, Scalar)

PUT -- Updating information in a server/database etc body: {} | Content-Type: 'application/json'


HTTP Status Codes:

200 -- Succeeded
400 -- Bad Request
500 -- Server Error 
401 -- Unauthorized
403 -- Forbidden Access
404 -- NOT FOUND
201 -- Modified

```

> ### Listening for events

```js

// Receive Data
window.addEventListener('message', function(event) {
    console.log(event.data);    
});

// Send Data

const data = {}

fetch('https://${GetParentResourceName()}/nuiCallback', {
    headers: {'Content-Type': 'application/json'},
    body: json.stringify(data), // data is a javascript object, stringify ensures that the JSON is formatted to string before being sent
    method: 'POST' // POST sends information through HTTP
})

```


# Version Control in Practice x CLI expansion

[Download Git](https://git-scm.com/downloads)


> Useful Commands

```
cat: Shows/Displays the content of a file

NOTE: If you don't have VIM do the following: sudo apt-get install vim -y
vim/nano: Text Editors within the CLI
```