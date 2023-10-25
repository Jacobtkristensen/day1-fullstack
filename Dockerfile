FROM openjdk:17-jdk-slim-bullseye
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x mvnw && ./mvnw dependency:resolve

COPY src ./src
#RUN apt-get update && apt-get install dos2unix
#RUN dos2unix mvnw
CMD ["./mvnw", "spring-boot:run"]