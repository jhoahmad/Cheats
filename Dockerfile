FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3-pip python-dev
RUN pip install Flask

COPY test_lorna.py .

CMD [ "python3", "./test_lorna.py" ]

