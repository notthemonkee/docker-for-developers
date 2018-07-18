Demo: Images & Containers

See slides

##Hello world image: hello-world
`docker pull hello-world`

`docker run hello-world`
##Show our images

`docker image ls`

`docker images`

##Show our containers

`docker ps -a`

##Remove a container

docker ps -a

docker rm <first digits of ID>

##Remove an image

`docker image ls`

`docker image rm <first digits of container ID>`

`docker rmi <first digits of container ID>`

Can also use full container or image name