#!/bin/bash

sudo apt update -qq -y
sudo apt install -qq -y automake checkinstall libsdl2-dev libva-dev libluajit-5.1-dev libgles2-mesa-dev libtool libvdpau-dev libxcb-shm0-dev texinfo libfontconfig1-dev libfribidi-dev python-docutils libbluray-dev libjpeg-dev libtheora-dev libvorbis-dev libgnutls28-dev linux-headers-rpi2 libomxil-bellagio-dev xdotool libcdio-cdda-dev libcdio-paranoia-dev libdvdread-dev libdvdnav-dev libbluray-dev

#apt install -qq -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

./configure \
  --prefix=/usr \
  --enable-gpl \
  --enable-nonfree \
  --enable-static \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-omx \
  --enable-omx-rpi \
  --enable-mmal \
  --enable-libxcb \
  --enable-libfreetype \
  --enable-libass \
  --enable-gnutls \
  --disable-opencl \
  --enable-libcdio \
  --enable-libbluray \
  --extra-cflags="-march=armv8-a+crc -mfpu=neon-fp-armv8 -mtune=cortex-a53" \
  
make -j 4
