FROM ubuntu:16.10
MAINTAINER Calvin Tong

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y vim git python3 python3-pip python3-dev

RUN pip3 install --upgrade pip

RUN mkdir -p /usr/papers

WORKDIR /usr/papers

ADD . /usr/papers

RUN /bin/bash
