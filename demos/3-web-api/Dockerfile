FROM ortussolutions/commandbox

# MAINTAINER Dave Jones

LABEL Maintainer="dave@davidhjones.com"
LABEL Description="A simple docker file that builds an ColdFusion server image with the web app files copied into the image from the build directory."

EXPOSE 8080

# The Commandbox image we're basing this image on uses the /app directory as it's web root
# Here we copy over the files for the API application from the build directory (.) to the /app directory in the container.

COPY ./api/ /app/
COPY ./api/images/ /app/images/