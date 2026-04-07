#!/bin/bash

#====================================================================================
# Secure boot
#====================================================================================

echo -e "**** Secure Boot Check ****\n"
sleep 2
sudo apt-get install mokutil
sleep 2
result=$(mokutil --sb-state)
echo $result
echo
sleep 1

#====================================================================================
# Firewall
#====================================================================================

echo -e "**** Firewall disable action ****\n"
sleep 2
sudo ufw stop
sudo ufw disable
echo -e "Done\n"
sleep 1

#====================================================================================
# Install required packages
#====================================================================================

echo -e "**** Installing required packages ****\n"
sleep 2
sudo apt-get install -y chrony wget lsof telnet sysstat net-tools unzip
echo -e "Done\n"
sleep 1


