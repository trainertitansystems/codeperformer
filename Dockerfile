# Use a base image with JDK
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the Gradle build script
COPY settings.gradle /app/
COPY build.gradle /app/

# Copy the source code
COPY src /app/src

# Command to build the application
RUN gradle build

# Copy the built JAR file into the container
COPY performance-0.0.1-SNAPSHOT.jar performance-0.0.1-SNAPSHOT.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "performance-0.0.1-SNAPSHOT.jar"]
