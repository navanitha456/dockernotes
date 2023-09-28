FROM ubuntu:latest
LABEL name="nilima" place="guntur"
RUN  apt update && apt install apache2 -y
RUN  apt install php libapache2-mod-php php-mysql
COPY info.php /var/www/html/
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
