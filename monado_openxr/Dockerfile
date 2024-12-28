FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt-get install -y tzdata software-properties-common apt-utils

ENV TZ=Europe/Germany
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -u 1000 -m monado

RUN apt install -y build-essential gcc g++
RUN apt install -y cmake git 
RUN apt install -y libz-dev libeigen3-dev python3-dev
RUN apt install -y libudev-dev libusb-1.0-0-dev libv4l-dev
RUN apt install -y libvulkan-dev vulkan-tools
RUN apt install -y libopengl-dev libgl1-mesa-dev glslang-tools
RUN apt install -y libxrandr-dev libxcb1-dev libwayland-dev

USER monado

ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

RUN cd ~ && git clone https://gitlab.freedesktop.org/monado/monado.git
RUN cd ~/monado && mkdir build
RUN cd ~/monado/build && \
 cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$(pwd)/../install -G "Unix Makefiles" && \
 cmake --build . && \
 cmake --install . --prefix $(pwd)/../install
