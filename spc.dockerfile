FROM ubuntu:plplot/ubuntu-latest
RUN  apt update && apt install openjdk-8-jdk -y && apt install maven -y && apt install git -y 
RUN  git clone https://github.com/hemachaitanya/game-of-life.git && cd game-of-life && mvn package
EXPOSE 9090
CMD [ "java","-jar"," target/game-of-life-1.0-SNAPSHOT.jar" ]


FROM ubuntu:latest
RUN apt update && apt install openjdk-17-jdk -y && apt install maven -y && apt install git -y 
RUN git clone https://github.com/spring-projects/spring-petclinic.git && cd spring-petclinic && \
    mvn package
WORKDIR  /spring-petclinic/target
EXPOSE 8080
CMD ["java" ,"-jar" , "spring-*.jar"]


FROM amazoncorretto:17-alpine-jdk
ADD https://s3-devops-bucketversion.s3.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar /spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-3.1.0-SNAPSHOT.jar" ]