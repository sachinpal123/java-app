FROM maven:3.5-jdk-8 as maven
# copy the project files
COPY ./pom.xml ./pom.xml
# build all dependencies
RUN mvn dependency:go-offline -B
# copy your other files
COPY ./src ./src
# build for release
RUN mvn clean install -DskipTests=true
# our final base image
FROM openjdk:8-jdk-alpine
# set deployment directory
WORKDIR /
# copy over the built artifact from the maven image
COPY --from=maven target/*.jar /

EXPOSE 8080
# set the startup command to run your binary

CMD ["java", "-jar", "user-group-management.jar"]
