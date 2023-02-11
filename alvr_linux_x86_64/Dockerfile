FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt-get install -y tzdata software-properties-common

ENV TZ=Europe/Germany
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -u 1000 -m alvr

RUN add-apt-repository -y ppa:savoury1/ffmpeg4
RUN add-apt-repository -y ppa:savoury1/ffmpeg5

RUN apt update && apt upgrade -y

RUN apt install -y unzip ffmpeg
RUN apt install -y build-essential git cmake curl wget 
RUN apt install -y pkg-config nasm libfuse2
RUN apt install -y libclang-dev libssl-dev libfontconfig1-dev
RUN apt install -y libva-dev libdrm-dev libvulkan-dev libx264-dev libx265-dev libasound2-dev libjack-jackd2-dev libxrandr-dev libunwind-dev libffmpeg-nvenc-dev 
RUN apt install -y libavutil-dev libavcodec-dev libavfilter-dev

USER alvr

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y

ENV PATH=/home/alvr/.cargo/bin:$PATH
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
