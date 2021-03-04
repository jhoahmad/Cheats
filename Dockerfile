FROM ubuntu:16.04

MAINTAINER Lorna Chepkoech

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean 

EXPOSE 80
CMD ["nginx"]
