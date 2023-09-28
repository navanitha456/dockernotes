FROM ubuntu:latest
LABEL name="nilima" place="hyd"
RUN apt update && apt install openjdk-17-jdk -y
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key |  tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null && \
     echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ |  tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null && \
  apt update && apt-get install jenkins -y
EXPOSE 8080