# Use a base image with JDK
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Install Gradle
RUN apk add --no-cache curl unzip \
    && curl -fsSL https://services.gradle.org/distributions/gradle-8.2.1-bin.zip -o gradle.zip \
    && unzip gradle.zip \
    && mv gradle-8.2.1 /opt/gradle \
    && ln -s /opt/gradle/bin/gradle /usr/bin/gradle \
    && gradle --version

# Copy the Gradle build scripts and source code
COPY settings.gradle /app/
COPY build.gradle /app/
#COPY src /app/src

# Build the application
RUN gradle build

# Copy the built JAR file into the container
COPY build/libs/performance-0.0.1-SNAPSHOT.jar /app/performance-0.0.1-SNAPSHOT.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "performance-0.0.1-SNAPSHOT.jar"]
