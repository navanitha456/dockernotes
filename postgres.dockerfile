FROM ubuntu:latest
LABEL author="hemachaitanya"
LABEL project="postgresql"
ARG HOME_DIR='/studentcourses'
ADD . $HOME_DIR
RUN apt update && apt install python3 -y
ENV POSTGRES_USER=panaramic
ENV POSTGRES_PASSWORD=trekking
ENV POSTGRES_DB=psql
EXPOSE 8080
RUN pip install -r requirements.txt
ENTRYPOINT [ "python","app.py" ]