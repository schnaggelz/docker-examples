FROM ubuntu:24.04

ARG APT_PREF
ARG AMDGPU_VERSION
ARG ROCM_VERSION
ARG ROCM_ARCH="gfx1100"

RUN echo "$APT_PREF" > /etc/apt/preferences.d/rocm-pin-600

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    curl \
    gnupg \
    nano \
    wget \
    sudo \
    less \
    git \
    cmake \
    bzip2 \
    unzip \
    kmod \
    file \
    byobu

RUN apt-get update && apt-get install -y --no-install-recommends \
    libelf1 \
    libnuma-dev \
    libjpeg-dev \
    libcurl4-openssl-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    python3-virtualenv

RUN curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ noble main" | tee /etc/apt/sources.list.d/rocm.list \
  && printf "deb [arch=amd64] https://repo.radeon.com/amdgpu/$AMDGPU_VERSION/ubuntu noble main" | tee /etc/apt/sources.list.d/amdgpu.list

RUN apt-get update && apt-get install -y --no-install-recommends rocm-dev libhipblas-dev librocblas-dev

RUN groupadd -g 109 render

RUN cd /opt && git clone https://github.com/ggerganov/llama.cpp && cd llama.cpp \
  && HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -R)" cmake -S . -B build -DGGML_HIP=ON -DAMDGPU_TARGETS=$ROCM_ARCH -DCMAKE_BUILD_TYPE=Release -DLLAMA_CURL=ON \
  && cmake --build build --config Release -- -j 32
