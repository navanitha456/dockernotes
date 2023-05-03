FROM ubuntu:latest
RUN apt update && apt install wget -y
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
#RUN rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y apt-transport-https aspnetcore-runtime-7.0
RUN apt-get update && apt-get install nginx -y 
RUN apt install systemctl -y
RUN systemctl start nginx
COPY 1.txt /etc/nginx/sites-available/default
RUN apt-get update && apt-get install aspnetcore-runtime-7.0 -y && apt-get install dotnet-runtime-7.0  
RUN mkdir -p /var/www/nopCommerce && cd /var/www/nopCommerce
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip /var/www/nopCommerce
WORKDIR /var/www/nopCommerce
RUN apt install unzip &&  unzip nopCommerce_4.60.2_NoSource_linux_x64.zip
RUN mkdir logs && cd .. 
COPY ./nopCommerce.service /etc/systemd/system/nopCommerce.service
WORKDIR /var/www/
RUN chgrp -R www-data nopCommerce/ && chown -R www-data nopCommerce/ 
WORKDIR /var/www/nopCommerce
EXPOSE 80
CMD [ "service", "nginx","start"]




    
WORKDIR /var/www/nopCommerce






FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="khaja" organization="qt" project="learning"
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip /nop/nopCommerce_4.60.2_NoSource_linux_x64.zip
WORKDIR /nop
RUN apt update && apt install unzip -y && \
    unzip /nop/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir /nop/bin && mkdir /nop/logs
EXPOSE 5000
CMD [ "dotnet", "Nop.Web.dll", "http://0.0.0.0:5000","--urls" ]

