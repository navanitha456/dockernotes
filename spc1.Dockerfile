FROM  17-alpine3.17-jdk
LABEL authfhksj="neelima" organization="qt" purpuse="project"
ADD https://s3-devops-bucketversion.s3.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar /spc/spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java","-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]