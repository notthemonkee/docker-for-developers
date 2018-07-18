# Docker SQL Server Database Container

This demonstrates creating and running a SQL Server database in a container. This shows how the data in the database persists even though the container is stopped and started.

Run the docker commands in the current directory to create and run a SQL Server image and container.

### Pull the SQL Server image

`docker pull microsoft/mssql-server-linux`

### Run the container

`docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=MyPassword?123' -p 1433:1433 --name sac-interactive-sql microsoft/mssql-server-linux`

### Create the database

Connect to the database using your tool of choice.

* Host: 127.0.0.1
* Port: 1433
* Username: sa
* Password: MyPassword?123

Run the create-db.sql 
This script creates a new table and populates it with data. This table and data will persist as long as the container exists.

`docker stop sac-interactive-sql`

Database server is now stopped, can't connect to the database.

`docker start sac-interactive-sql`

Database comes back on line and table and data are just as we left them.
