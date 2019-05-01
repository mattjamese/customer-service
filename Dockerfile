FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} customer-service.jar
ENTRYPOINT ["java","-jar","/customer-service.jar"]
EXPOSE 3333