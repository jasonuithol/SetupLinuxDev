if [ -f "/etc/X11/xorg.conf.d/20-hdr.conf" ]; then
    echo /etc/X11/xorg.conf.d/20-hdr.conf exists, please edit
    exit
else

sudo tee /etc/X11/xorg.conf.d/20-hdr.conf <<EOF
Section "Device"
    Identifier "Device0"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "Monitor"
    Identifier "Monitor0"
EndSection

Section "Screen"
    Identifier "Screen0"
    Device "Device0"
    Monitor "Monitor0"
    DefaultDepth 30
    SubSection "Display"
        Depth 30
        Modes "3440x1440"  # set to your monitor's native resolution
    EndSubSection
EndSection
EOF

fi

echo to check results, reboot, then "cat /var/log/Xorg.0.log | grep -i nvidia"
