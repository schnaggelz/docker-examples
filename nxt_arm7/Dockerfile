FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Germany
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -u 1000 -m nxt

RUN apt update

RUN apt install -y tzdata
RUN apt install -y build-essential
RUN apt install -y git make cmake
RUN apt install -y gcc-arm-none-eabi

USER nxt

