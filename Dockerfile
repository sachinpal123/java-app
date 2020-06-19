FROM openjdk:8-jdk-alpine
COPY /target/*.jar /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java","-jar","/usr/app/app-0.0.1.jar"]