# Docker ColdFusion Web App Container

This is a simple demo image browser web application where the web server will run in a Docker container and the source code for the app lives on the host machine. 

Run the docker commands in the current directory to create and run a CommandBox image and container with a running ColdFusion web server.

### Pull the ColdFusion image
`docker pull ortussolutions/commandbox`

### Run the container
`docker run -p 8080:8080 ortussolutions/commandbox`

### Open the web application in browser

[http://localhost:8080](http://localhost:8080)

Oops! This opened to the default CommandBox application. That's not what we wanted. The web server is running but we need to link our app's source code to the container.

### Run container with application code mapped to web root.
Find the running container and stop it:

`docker ps`

`docker stop <container id>`

`docker run -p 8080:8080 -v "$(pwd):/app" ortussolutions/commandbox`

[http://localhost:8080](http://localhost:8080)

### Don't want to see the output? Want your console back? No problem, run in daemon mode.

`docker ps`

`docker stop <container id>`

`docker run -p 8080:8080 -v "$(pwd):/app" -d ortussolutions/commandbox`

### Name the container

`docker ps`

`docker stop <container id>`

`docker run -p 8080:8080 -v "$(pwd):/app" -d --name sac-interactive-cf ortussolutions/commandbox`