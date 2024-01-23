FROM adoptopenjdk/openjdk11

RUN mkdir -p /opt/app

ENV PROJECT_HOME /opt/app

COPY /target/*.jar $PROJECT_HOME/app.jar
WORKDIR $PROJECT_HOME
EXPOSE 8090
ENTRYPOINT ["java","-jar","app.jar"]
