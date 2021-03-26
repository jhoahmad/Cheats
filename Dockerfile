FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3-pip python-dev

COPY test2.py .

CMD [ "python3", "./test2.py" ]

