FROM ubuntu:24.04

ARG ROCM_VERSION
ARG AMDGPU_VERSION
ARG APT_PREF

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
    libnuma-dev \
    libelf1 \
    kmod \
    file \
    python3-dev \
    python3-pip

RUN curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ noble main" | tee /etc/apt/sources.list.d/rocm.list \
  && printf "deb [arch=amd64] https://repo.radeon.com/amdgpu/$AMDGPU_VERSION/ubuntu noble main" | tee /etc/apt/sources.list.d/amdgpu.list

RUN apt-get update && apt-get install -y --no-install-recommends rocm-dev || { cat /var/log/apt/term.log; exit 1; }

RUN groupadd -g 109 render