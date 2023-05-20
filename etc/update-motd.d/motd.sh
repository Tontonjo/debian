#!/bin/sh

# Tonton Jo - 2023
# Join me on Youtube: https://www.youtube.com/c/TontonJo

#V1.0: Initial Release

wget -qO /etc/update-motd.d/01-jo https://github.com/Tontonjo/debian/raw/master/etc/update-motd.d/01-jo
chmod +x /etc/update-motd.d/01-jo
cp /etc/motd /etc/motd.bck && rm -rf /etc/motd
rm -rf /etc/update-motd.d/10-uname
