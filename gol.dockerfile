FROM alpine/git AS vcs
RUN cd / && git clone https://github.com/hemachaitanya/game-of-life.git

FROM maven:3-amazoncorretto-8 AS build
COPY --from=vcs /game-of-life /game-of-life
RUN cd /game-of-life && mvn package

FROM tomcat:9-jdk8
LABEL author='hemachaitanya' project='ramseetha'
COPY --from=build  /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war







# Spring Pet Clinic project
FROM ubuntu:22.04 AS vcs
RUN apt update  && apt install git -y 
RUN cd / &&  git clone https://github.com/hemachaitanya/spring-petclinic.git

FROM ubuntu:22.04 AS build
RUN apt update  && apt install openjdk-17-jdk -y && apt install maven -y
COPY --from=vcs /spring-petclinic /spring-petclinic 
WORKDIR  /spring-petclinic 
RUN mvn package

FROM ubuntu:22.04 AS start
RUN apt update && apt install openjdk-17-jdk -y
COPY --from=build /spring-petclinic/target/spring-petclinic-3.0.0-SNAPSHOT.jar /tools/spring-petclinic-3.0.0-SNAPSHOT.jar
WORKDIR  /tools
EXPOSE 8080
CMD [ "java", "-jar", "/tools/spring-petclinic-3.0.0-SNAPSHOT.jar" ]




#python based application Student cource rest API

FROM python:3.7-alpine AS
LABEL author=KHAJA
LABEL blog=directdevops.blog
ARG HOME_DIR='/studentcourses'
ADD . $HOME_DIR
ENV MYSQL_USERNAME='directdevops'
ENV MYSQL_PASSWORD='directdevops'
ENV MYSQL_SERVER='localhost'
ENV MYSQL_SERVER_PORT='3306'
ENV MYSQL_DATABASE='test'
EXPOSE 8080
WORKDIR $HOME_DIR
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "app.py"]



# git clone https://github.com/DevProjectsForDevOps/StudentCoursesRestAPI.git
# cd StudentCoursesRestAPI
# pip install -r requirements.txt
# python app.py


## tomcat through

FROM ubuntu:latest
RUN apt update && apt install openjdk-8-jdk -y && apt install maven -y && apt install git -y
RUN git clone https://github.com/hemachaitanya/game-of-life.git && cd game-of-life &&\ 
    mvn install 
WORKDIR gameoflife-web
CMD ["mvn","jetty:run"]




##apache2 installations

FROM baseImage
RUN apt update && apt install apache2 -y
EXPOSE 8080
CMD [ "systemctl","start","httpd" ]