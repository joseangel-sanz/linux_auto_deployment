#!/bin/bash

FALCON_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES_DIR="$FALCON_DIR/../../files"

echo "**** falcon-sensor install/configured ****"
echo
sleep 5
#echo -e "SCRBEPODK009011 10.255.83.131\nSCRBEPODK009003 10.255.83.233\nSCRBEPODK009004 10.255.83.234" >> /etc/resolv.conf
apt-get build-dep "$FILES_DIR"/falcon-sensor*.deb
sudo dpkg -i "$FILES_DIR"/falcon-sensor*.deb
/opt/CrowdStrike/falconctl -s --cid=58CE029866E14481A529D5E495AEB242-76
/opt/CrowdStrike/falconctl -s --aph=10.0.11.1 --app=9400
/opt/CrowdStrike/falconctl -s --apd=FALSE

echo "**** falcon-sensor restart ****"
systemctl restart falcon-sensor.service

echo Completed
echo