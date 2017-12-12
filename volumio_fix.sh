#!/bin/bash
if [ $SUDO_USER ]; then echo "Must be run as non-root user";exit ; else user=`whoami`; fi

sudo apt-get install -y libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev libltdl-dev libsamplerate0-dev libsndfile1-dev libasound2-dev libavahi-client-dev libspeexdsp-dev liborc-0.4-dev intltool libtdb-dev libssl-dev libjson0-dev libsbc-dev libcap-dev

wget www.kernel.org/pub/linux/bluetooth/bluez-5.23.tar.xz
tar xvf bluez-5.23.tar.xz

cd bluez-5.23/
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-library --disable-systemd
sudo make
sudo make install
sudo install -v -dm755 /etc/bluetooth
sudo install -v -m644 src/main.conf /etc/bluetooth/main.conf


