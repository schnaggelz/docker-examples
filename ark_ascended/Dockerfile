FROM ubuntu:24.04

# Accept PUID and PGID environment variables to allow runtime specification
ARG PUID=1000
ARG PGID=1000

# Set a default timezone, can be overridden at runtime
ENV TZ=UTC
ENV PUID=${PUID}
ENV PGID=${PGID}

# Install necessary packages
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y --no-install-recommends net-tools byobu python3 python3-pip python3-rcon
RUN apt install -y --no-install-recommends software-properties-common dbus iproute2
RUN apt install -y --no-install-recommends jq curl wget tar nano procps p7zip nano
RUN apt install -y --no-install-recommends lib32gcc-s1 libglib2.0-0 libglib2.0-0:i386 libvulkan1 libvulkan1:i386
RUN apt install -y --no-install-recommends libfontconfig1 libfontconfig1:i386 libfreetype6 libfreetype6:i386
RUN apt install -y --no-install-recommends libcups2 libcups2:i386 libnss3 libnss3:i386

# Cleanup to keep the image lean
RUN apt clean

# Setup steamcmd
WORKDIR /opt/steamcmd
RUN wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar zxvf -

    # Setup the Proton GE
WORKDIR /usr/local/bin
RUN curl -sLOJ "$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .tar.gz)"
RUN tar -xzf GE-Proton*.tar.gz --strip-components=1; rm GE-Proton*.*

# Setup machine-id for Proton
RUN rm -f /etc/machine-id; dbus-uuidgen --ensure=/etc/machine-id; rm /var/lib/dbus/machine-id; dbus-uuidgen --ensure

# Setup rcon-cli
WORKDIR /tmp/
RUN set -ex; \
    wget -qO- https://github.com/itzg/rcon-cli/releases/download/1.6.3/rcon-cli_1.6.3_linux_amd64.tar.gz | tar xvz && \
    mv rcon-cli /usr/local/bin/rcon-cli && \
    chmod +x /usr/local/bin/rcon-cli

# Ensure that server directory exists
WORKDIR /home/ubuntu/server
COPY scripts .

RUN chown -R ubuntu:ubuntu /home/ubuntu
RUN chown -R ubuntu:ubuntu /home/ubuntu/server
RUN chown -R ubuntu:ubuntu /opt/steamcmd

USER ubuntu
WORKDIR /home/ubuntu

ENV PATH="$PATH:/home/ubuntu/server"
