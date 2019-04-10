myNewQuery:
    mysql_query.run:
        - database: mainDB
        - query: "CREATE TABLE Persons (PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));"
        - output: "/tmp/log.txt"