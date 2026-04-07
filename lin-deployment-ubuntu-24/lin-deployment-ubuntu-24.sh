#!/bin/bash

#==============================================================================
# Script Name: lin-deployment-lin-24.sh
# Version: v1.0
# Publish date: 26/03/2026
# Description: Script to automate new Linux virtual machine deployments
# Author: Jose Angel Sanz Villar (JAS228)
# Team: Regional HUBS IT Service Delivery
# Licenses: Intellectual property of Jose Angel Sanz Villar. All rights reserved
#==============================================================================

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Give permission to the entire directory
chmod -R 777 "$SCRIPT_DIR"

echo  "--------------------------------------------------------------------------------------------------------------"
echo  "APMT - APMT HUBs Service Delivery team - Script v1.0 : Ubuntu 24 Deployment"
echo  "--------------------------------------------------------------------------------------------------------------"
echo
echo  "This script will prepare the standard Maersk/APMT OS Linux config"
echo
echo  "Prerequisites:"
echo
echo  "1 - Has a working internet connection to download linux patches and packages"
echo  "You can check the connectivity using the script: /other_tools/connectivity_check.sh"
echo
echo  "2 - Run the script using root permissions"
echo
echo  "THIS WILL FUNDAMENTALLY ALTER THE LINUX OPERATING SYSTEM, CTRL+C within 10 seconds if you want to cancel"
echo
sleep 10

# Bash Menu

PS3="[Select an option from the list:]"
options=("New full deployment" "Install Security tools" "Secure Boot Check" "Add users" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "New full deployment")

        #====================================================================================
        # Intalling certs
        #====================================================================================
    
        echo "**** Intalling certs ****"
        echo
        source "$SCRIPT_DIR/defaults/install_certs.sh"
        echo -e "Done\n"
        sleep 3

        #========================================================================================================================
        # Intalling pre-requisites: Checking secure boot, disabling firewall, disabling SELINUX and installing required packages
        #========================================================================================================================

        echo "**** Intalling pre-requisites ****"
        echo
        source "$SCRIPT_DIR/defaults/other.sh"
        echo -e "Done\n"
        sleep 3

        #====================================================================================
        # Intalling security tools
        #====================================================================================
    
        echo "**** Intalling security tools ****"
        echo
        source "$SCRIPT_DIR/defaults/install_security_tools.sh"
        echo -e "Done\n"
        sleep 3
        
        #====================================================================================
        # Configuring NTP
        #====================================================================================

        echo "**** Configuring NTP ****"
        echo
        source "$SCRIPT_DIR/defaults/ntp.sh"
        echo -e "Done\n"
        sleep 3

        #====================================================================================
        # Configuring banners
        #====================================================================================

        echo "**** Configuring banners ****"
        echo
        source "$SCRIPT_DIR/defaults/banners.sh"
        echo -e "Done\n"
        sleep 3

        break;;

        "Install Security tools")
        echo "**** Intalling security tools ****"
        echo
        source "$SCRIPT_DIR/defaults/install_security_tools.sh"
        echo -e "Done\n"
        sleep 3

        break;;

        "Secure Boot Check")
        #====================================================================================
        # Secure boot
        #====================================================================================

        echo -e "**** Secure Boot Check ****\n"
        sleep 2
        result=$(mokutil --sb-state)
        echo "$result"
        echo
        sleep 1;;

        "Add users")
        echo "**** Adding users ****"
        echo
        source "$SCRIPT_DIR/defaults/users.sh"
        echo -e "Done\n"
        sleep 3
        break;;

        "Quit") break;;

        *) echo "Invalid option";;
    esac
done