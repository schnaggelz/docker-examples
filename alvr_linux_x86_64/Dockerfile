FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Germany
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -u 1000 -m alvr

RUN apt update
RUN apt install -y tzdata
RUN apt install -y build-essential
RUN apt install -y git cmake curl wget
RUN apt install -y pkg-config nasm libfuse2
RUN apt install -y libva-dev libdrm-dev libvulkan-dev libx264-dev libx265-dev libasound2-dev libjack-jackd2-dev libxrandr-dev libunwind-dev libffmpeg-nvenc-dev

USER alvr

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN source $HOME/.cargo/env
