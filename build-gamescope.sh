#!/bin/bash
set -e  # Exit on any error

echo Currently broken due to a bug beyond our control.  There's a version conflict between wayland 1.22 and 1.23.
echo Run this on a distro that includes wayland 1.23 by default (Ubuntu 24.04 and later)
exit

sudo apt install git meson ninja-build build-essential pkg-config \
  libdrm-dev libvulkan-dev libwayland-dev wayland-protocols \
  libxkbcommon-dev libcap-dev libx11-dev libxcomposite-dev \
  libxrender-dev libxext-dev libxdamage-dev libxres-dev \
  glslang-tools libsdl2-dev libpipewire-0.3-dev libseat-dev \
  libliftoff-dev libdisplay-info-dev libavif-dev libinput-dev \
  libxmu-dev libxi-dev libxcb-res0-dev hwdata cmake libx11-xcb-dev \
  libxtst-dev libpixman-1-dev

cd ~/Projects
if [ ! -d "gamescope" ]; then
#    git clone https://github.com/ValveSoftware/gamescope.git

    # Fixed the wayland 1.22 vs 1.23 version conflict
    # https://github.com/ValveSoftware/gamescope/issues/1496
    # https://github.com/pyinstaller/pyinstaller/issues/8963
    git clone https://github.com/adamdmoss/gamescope-ubuntu24.git gamescope
fi
cd gamescope
git submodule update --init --recursive

if [ -d "build" ]; then
    rm -rf build
fi

meson setup build/
ninja -C build/

sudo meson install -C build/ --skip-subprojects

gamescope --version

echo Add this to the Helldivers2 launch options: "gamescope -W 3440 -H 1440 -f --hdr-enabled --hdr-debug-force-output -- %command%"
