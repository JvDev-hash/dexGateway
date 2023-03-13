#Dcker file for the Read Servicea
#
# Version 0.0.1

#jdk image
FROM adoptopenjdk/openjdk11:alpine-slim

# install

# label for the image
LABEL Description="Api Gateway" Version="0.0.1"

# the version of the archive
ARG VERSION=0.0.1

# mount the temp volume
VOLUME /tmp

# Add the service as app.jar
ADD target/dexGateway-${VERSION}-SNAPSHOT.jar app.jar

# touch the archive for timestamp
RUN sh -c 'touch /app.jar'

# entrypoint to the image on run
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
