FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

COPY requirements.sh /requirements.sh
RUN sh requirements.sh

WORKDIR /home
