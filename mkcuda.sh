#!/bin/bash
if [ $(whoami) != 'root' ]; then echo "Run as root: sudo ${0} ${*}" > /dev/stderr; exit 1; fi

pushd nv-codec-headers && make install && popd

apt update -qq -y
apt install -qq -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

./configure \
  --enable-cuda-nvcc \
  --nvcc=/usr/local/cuda/bin/nvcc \
  --enable-cuvid \
  --enable-nvenc \
  --enable-nonfree \
  --enable-libnpp \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64

make -j 4 && sudo make install && sudo ldconfig
