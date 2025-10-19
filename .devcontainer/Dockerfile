FROM ubuntu:24.04
LABEL authors="timon"

ENTRYPOINT ["top", "-b"]

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    wget

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.27.0/bazelisk-linux-amd64 && \
    chmod 755 bazelisk-linux-amd64 && \
    mv bazelisk-linux-amd64 /usr/bin/bazelisk