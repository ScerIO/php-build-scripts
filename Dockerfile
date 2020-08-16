FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y \
    apt-utils \
    git \
    make \
    cmake \
    autoconf \
    automake \
    pkg-config \
    libtool libtool-bin \
    m4 wget gzip bzip2 \
    xz-utils bison zip g++

WORKDIR /home/php-build

COPY compile.sh install_musl.sh ./
RUN chmod +x compile.sh install_musl.sh

RUN sh install_musl.sh https://github.com/ScerIO/musl-cross-make/releases/download/v1.0 aarch64-linux-musl
RUN sh install_musl.sh https://github.com/ScerIO/musl-cross-make/releases/download/v1.0 x86_64-linux-musl

CMD ["bash"]