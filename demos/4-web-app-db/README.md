# Docker ColdFusion and SQL Server Database Containers

This demonstrates using docker-compose to creating and run ColdFusion and SQL Server containers for a simple data driven web application.  

### Build out the services

`docker-compose build`

### Start the services

`docker-compose up`

Or in daemon mode

`docker-compose up -d`

### Stop the services

`docker-compose down`

Stop the services and remove all the images.

`docker-compose down --rmi all`

### Check the status

`docker-compose ps`

### View log files

`docker-compose logs`