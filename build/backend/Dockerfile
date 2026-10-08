# Upstream's deployments/backend.dockerfile with these changes: the sources are copied from app/
# (upstream's app/backend/); the runtime image is eclipse-temurin:8-jre-alpine, because
# upstream's openjdk:8-jdk-alpine is gone from Docker Hub; the wait-for script (and the netcat it
# needs) is left out, since the machine starts only once the database answers; and the
# environment and command of upstream's deployments/docker-compose.yml are baked in, with the
# database host renamed from mysql-a7-streaming to db (the compose file's service name).
FROM docker.io/library/maven:3.6.0-jdk-11-slim AS build

COPY app/src /home/app/src

COPY app/pom.xml /home/app

RUN mvn -f /home/app/pom.xml install -U -Dmaven.test.skip=true

FROM docker.io/library/eclipse-temurin:8-jre-alpine

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

VOLUME /app

COPY --from=build /home/app/target/streaming-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENV JAVA_OPTS="" \
    spring.profiles.active=prod \
    A7_STREAMING_DATABASE_URL="jdbc:mysql://db:3306/streaming?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true" \
    A7_STREAMING_DATABASE_USERNAME=root \
    A7_STREAMING_DATABASE_PASSWORD=streaming

STOPSIGNAL SIGINT
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar", "-Xmx512m"]
