!/bin/bash

#==============================================================================
# Script Name: lin-deployment-lin-24.sh
# Version: v1.0
# Publish date: 26/03/2026
# Description: Script to automate new Linux virtual machine deployments
# Author: Jose Angel Sanz Villar (JAS228)
# Team: Regional HUBS IT Service Delivery
# Licenses: Intellectual property of Jose Angel Sanz Villar. All rights reserved
#==============================================================================

# Give permission to the entire directory

chmod -R 777 /root/lin-deployment-redhat-8

echo  "--------------------------------------------------------------------------------------------------------------"
echo  "APMT - APMT Infra L3 Team (RIO Team))- Script v1.0 : RHEL8 Linux Preparation"
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

PS3= "[Select an option from the list:]"
options=("1: New full deployment" "2: Subscribe servesr" "3: Install Security tools" "4: Secure Boot Check" "5: Add users" "6: Quit")
select opt in "${options[@]}"
do
    case $opt in
        "1: New full deployment")

        #====================================================================================
        # Intalling certs
        #====================================================================================
    
        echo "**** Intalling certs ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/install_certs.sh
        echo -e "Done\n"
        sleep 3

        #========================================================================================================================
        # Intalling pre-requisites: Checking secure boot, disabling firewall, disabling SELINUX and installing required packages
        #========================================================================================================================

        echo "**** Intalling pre-requisites ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/other.sh
        echo -e "Done\n"
        sleep 3

        #====================================================================================
        # Intalling security tools
        #====================================================================================
    
        echo "**** Intalling security tools ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/install_security_tools.sh
        echo -e "Done\n"
        sleep 3
        
        #====================================================================================
        # Configuring NTP
        #====================================================================================

        echo "**** Configuring NTP ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/ntp.sh
        echo -e "Done\n"
        sleep 3

        #====================================================================================
        # Configuring banners
        #====================================================================================

        echo "**** Configuring banners ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/banners.sh
        echo -e "Done\n"
        sleep 3

        break;;

        "2: Subscribe servesr")
        #====================================================================================
        # Subscribe
        #====================================================================================
        echo "**** Subscribing server ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/subscribe.sh
        echo -e "Done\n"
        sleep 3

        break;;

        "3: Install Security tools")
        echo "**** Intalling security tools ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/install_security_tools.sh
        echo -e "Done\n"
        sleep 3

        break;;

        "4: Secure Boot Check")
        #====================================================================================
        # Secure boot
        #====================================================================================

        echo -e "**** Secure Boot Check ****\n"
        sleep 2
        mokutil --sb-state = $result
        echo $result
        echo
        sleep 1
        break;;

        "5: Add users")
        echo "**** Adding users ****"
        echo
        source /root/lin-deployment-ubuntu-22/defaults/users.sh
        echo -e "Done\n"
        sleep 3
        break;;

        "6: Quit") break;;
        *) echo "Invalid option";;
    esac
done