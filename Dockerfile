FROM ubuntu:22.04

# Install ffmpeg to get ffplay using system package manager
RUN apt-get -y update && apt-get -y install ffmpeg

# Install some special fonts we use in testing, etc..
RUN apt-get -y install fonts-liberation

RUN apt-get install -y locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get install -y python3 python3-pip

# Update pip
RUN pip install --upgrade pip

ADD . /moviepy
RUN cd /moviepy && pip install . && pip install .[test] && pip install .[doc] && pip install .[lint]

    