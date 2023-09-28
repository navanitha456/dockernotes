FROM ubuntu:latest
LABEL name="nilima" place="guntur"
RUN  apt update && apt install apache2 -y &&\
      apt install php -y
COPY /info.php /var/www/html/info.php
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
