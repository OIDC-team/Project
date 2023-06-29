#FROM openjdk:17-ea-11-jdk-slim
#RUN mkdir /app
#ADD /build/libs/hotplace-0.0.1-SNAPSHOT.jar /app
#CMD [ "java", "-jar", "/app/hotplace-0.0.1-SNAPSHOT.jar" ]
#FROM openjdk:17-ea-11-jdk-slim
#RUN mkdir /app
#ADD /build/libs/hotplace-0.0.1-SNAPSHOT.jar /app
#CMD [ "java", "-jar", "/app/hotplace-0.0.1-SNAPSHOT.jar" ]
FROM openjdk:17-ea-11-jdk-slim

ARG JAR_FILE=./build/libs/hotplace-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]