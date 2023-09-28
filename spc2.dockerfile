FROM apache2ctl
label automission="neelima"organization="qt"purpose="project
add" https://s3-devops-bucketversion.s3.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar /spc/spring-petclinic-3.1.0-SNAPSHOT.jar
port 8080
