FROM alpine:3.11
RUN apk update  && apk --update add python3 
CMD ["sleep","10s"]






# Based on the latest version of the alpine image
FROM alpine:latest
RUN apk --update add python3 -y
COPY hello-docker.py /opt/
CMD ["python3", "/opt/hello-docker.py"]


FROM ubuntu:latest
RUN apt update && apt install python3.6 -y
CMD [ "sleep","1d" ]


FROM ubuntu:latest
RUN apt-get update && apt-get install python3.6 -y
CMD [ "sleep","1d" ]






FROM ubuntu:latest
ARG HOME_DIR='/var/www/html'
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install nginx -y
RUN apt update && apt install libapache2-mod-php php -y
WORKDIR ${HOME_DIR}
RUN echo "<?php phpinfo() ?>" > /var/www/html/info.php
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]
# git add php.dockerfile