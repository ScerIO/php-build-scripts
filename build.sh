#!/bin/bash

function download_binary {
	wget "https://github.com/ScerIO/musl-cross-make/releases/download/binary-files-v1.0/$1.tar.xz"
	sudo tar -xJf "$1.tar.xz" -C /usr/local/
	rm $1.tar.xz
}

function compile {
	sudo ./compile.sh -u -l -g -t $1 -x -s -j4 -f
	sudo mv install.log "install-$1.log"
	cd bin/php7/bin
	zip "../../../php-$1.zip" php php.ini
	cd ../../..
	sudo rm -rf bin install_data
}

sudo apt-get update > /dev/null
sudo apt-get install cmake make autoconf automake libtool libtool-bin m4 wget gzip bzip2 bison zip g++ -y > /dev/null

download_binary aarch64-linux-musl
download_binary arm-linux-musleabi

compile android-aarch64
compile android-armv7