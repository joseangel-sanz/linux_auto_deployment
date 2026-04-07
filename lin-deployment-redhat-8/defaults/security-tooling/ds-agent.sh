#!/bin/bash
# Bash Menu

PS3= "[Select an option from the list:]"
options=("1: NoProxy" "2: NRAProxy" "3: Zscaler Proxy" "4: Quit")
select opt in "${options[@]}"
do
    case $opt in
        "1: NoProxy")
            echo "**** Trendmicro install/configured No Proxy ****"
            source ./LinuxAgentDeploymentScript_NoProxy.sh
            echo Completed
            echo
            break;;
        "2: NRAProxy")
            echo "**** Trendmicro install/configured NRA Proxy ****"
            source ./LinuxAgentDeploymentScript_NRAProxy.sh
            echo Completed
            echo
            break;;
        "3: Zscaler Proxy")
            echo "**** Trendmicro install/configured Zscaler Proxy ****"
            source ./LinuxAgentDeploymentScript_ZscalerProxy.sh
            echo Completed
            echo
            break;;
        "4: Quit") break;;
        *) echo "Invalid option";;
    esac
done

