
# arg1 Url to list of musls
# arg2 Specified musl

wget -q "$1/$2.tar.xz"
tar -xJf "$2.tar.xz" -C /usr/local/
rm "$2.tar.xz"
