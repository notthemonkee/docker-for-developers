# Docker ColdFusion Web API Container

This is a simple demo image browser web application where that combines a static HTML client application with
a REST API served by a web server will run in a Docker container. We build a custom image for the API using a Dockerfile in which we copy over the files needed to run the API at time of image creation. Doing this lets the client application developer fire up the API container with no extra configuration.

Run the docker commands in the current directory to create and run a new image and container with a running ColdFusion REST API.

### Build the new image using a Dockerfile (notice the "." at the end)
`docker build -t notthemonkee/cf-rest-api .`

### Run the container
`docker run -p 8080:8080 --name cf-rest-api notthemonkee/cf-rest-api`

### Open a terminal session to the running container and examine the app directory

`docker exec -i -t cf-rest-api /bin/bash`

`# cd /app`

`# ls -la`

Notice that the REST web application files were copied over to the app directory

### Use a web browser to test the REST API

[localhost:8080/index.cfm/photos](http://localhost:8080/index.cfm/photos)

[localhost:8080/index.cfm/photo/2](http://localhost:8080/index.cfm/photo/2)

Fire up the client web app and see that it works, calling the API.