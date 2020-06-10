#!/bin/bash
if [ $(whoami) != 'root' ]; then echo "Run as root: sudo ${0} ${*}" > /dev/stderr; exit 1; fi

apt update -qq -y
apt install -qq -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

./configure \
  --enable-cuda-nvcc \
  --enable-cuvid \
  --enable-nvenc \
  --enable-nonfree \
  --enable-libnpp \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64
