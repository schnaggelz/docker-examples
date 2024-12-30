FROM ubuntu:24.04

# Runtime arguments
ARG APT_PREF
ARG AMDGPU_VERSION
ARG AMDGPU_ARCH
ARG ROCM_VERSION
ARG PUID=1000
ARG PGID=1000

RUN echo "$APT_PREF" > /etc/apt/preferences.d/rocm-pin-600

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    kmod \
    curl \
    gnupg \
    wget \
    git \
    cmake \
    less\
    byobu

# Install ROCm and AMDGPU
RUN curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ noble main" | tee /etc/apt/sources.list.d/rocm.list \
  && printf "deb [arch=amd64] https://repo.radeon.com/amdgpu/$AMDGPU_VERSION/ubuntu noble main" | tee /etc/apt/sources.list.d/amdgpu.list

RUN apt-get update && apt-get install -y --no-install-recommends \
  rocm-dev \
  libhipblas-dev \
  libcurl4-openssl-dev

RUN groupadd -g 109 render

RUN mkdir opt/llama.cpp && cd /opt/llama.cpp && git clone https://github.com/ggerganov/llama.cpp src && cd src \
  && HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -R)" cmake -S . -B build -DGGML_HIP=ON -DLLAMA_CURL=ON -DAMDGPU_TARGETS=$ROCM_ARCH -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/llama.cpp \
  && cmake --build build --config Release -- -j 32 && cmake --build build --config Release -- install

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     python3-dev \
#     python3-virtualenv
