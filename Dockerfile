FROM gradle:7.1.1-jdk8 AS build
COPY micronaut-cli.yml build.gradle.kts gradle.properties settings.gradle.kts gradlew.bat gradlew ./
COPY src/ src/
RUN --mount=type=cache,target=/home/gradle/.gradle gradle clean buildLayers --no-daemon

#FROM gcr.io/distroless/java:11
FROM openjdk
COPY --from=build /home/gradle/build/docker/layers/libs /home/app/libs
COPY --from=build /home/gradle/build/docker/layers/resources /home/app/resources
#COPY /build/reports/profile /home/app/build/reports
COPY --from=build /home/gradle/build/docker/layers/application.jar /home/app/application.jar

EXPOSE 8081
ENTRYPOINT ["java", "-jar", "/home/app/application.jar"]