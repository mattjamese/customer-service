FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/customer-service-0.1.jar customer-service.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/customer-service.jar"]
EXPOSE 3333