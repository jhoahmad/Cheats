FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3-pip python-dev

COPY app1.py .

CMD [ "python", "./app1.py" ]

