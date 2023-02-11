FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt-get install -y tzdata software-properties-common

ENV TZ=Europe/Germany
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -u 1000 -m monado



USER monado

ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
