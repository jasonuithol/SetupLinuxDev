#!/bin/bash
set -e  # Exit on any error

echo 404 URLs - Also - this patch is no longer needed on Ubuntu 24.04 as it includes Wayland 1.23 by default.
exit 

cd ~/Downloads
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-client0_1.23.0-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-cursor0_1.23.0-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-server0_1.23.0-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-egl1_1.23.0-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-dev_1.23.0-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/w/wayland/libwayland-bin_1.23.0-1_amd64.deb

sudo dpkg -i libwayland-*.deb
