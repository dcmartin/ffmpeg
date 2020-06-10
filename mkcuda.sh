#!/bin/bash

pushd nv-codec-headers && sudo make install && popd

sudo apt update -qq -y
sudo apt install -qq -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

./configure \
  --enable-cuda-nvcc \
  --nvcc=/usr/local/cuda/bin/nvcc \
  --enable-cuvid \
  --enable-nvenc \
  --enable-nonfree \
  --enable-libnpp \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64

make -j 10
