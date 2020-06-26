#!/usr/bin/env bash

set -ex

sudo apt-get update
sudo apt-get install make autoconf automake libtool libtool-bin m4 wget libc-bin gzip bzip2 bison g++ git cmake pkg-config -y

function download_binary {
	wget -q "https://github.com/ScerIO/musl-cross-make/releases/download/v1.0/$1.tar.xz"
	sudo tar -xJf "$1.tar.xz" -C /usr/local/
	rm "$1.tar.xz"
}

function compile {
	sudo ./compile.sh -u -l -g -t $1 -x -s -j4 -f
	sudo mv install.log "install-$1.log"
	cd bin/php7/bin
	zip "../../../php-$1.zip" php php.ini
	cd ../../..
	sudo rm -rf bin install_data
}

download_binary aarch64-linux-musl

compile android-aarch64

