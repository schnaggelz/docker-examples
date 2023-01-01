FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -u 1000 -m bob

RUN apt update
RUN apt install -y build-essential curl wget git

USER bob
