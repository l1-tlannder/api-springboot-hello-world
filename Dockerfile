FROM openjdk:14 AS BUILDER
ENV APP_HOME=/opt/app/
RUN mkdir -p $APP_HOME/src/main/java
WORKDIR $APP_HOME
COPY build.gradle gradlew gradlew.bat $APP_HOME
COPY gradle $APP_HOME/gradle
# CACHE
# Download dependencies, This step using dockers fs layers cache
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN ./gradlew build -x :bootJar -x test --continue
COPY . .
RUN ./gradlew build

FROM openjdk:14-alpine
ENV APP_HOME=/opt/app
WORKDIR $APP_HOME
COPY --from=BUILDER $APP_HOME/build/libs/app.jar $APP_HOME/app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]