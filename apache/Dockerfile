FROM ubuntu:latest
LABEL name="nilima" place="guntur"
RUN  apt update && apt install apache2 -y
RUN  apt install php -y && apt install libapache2-mod-php  -y
COPY info.php /var/www/html/
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
