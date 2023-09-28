FROM ubuntu:latest
LABEL name="nilima" place="guntur"
RUN  apt update && apt install apache2 -y &&\
      apt install php -y && apt install libapache2-mod-php  -y && rm -rf /var/lib/apt/lists/*
COPY /info.php /var/www/html/info.php
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
