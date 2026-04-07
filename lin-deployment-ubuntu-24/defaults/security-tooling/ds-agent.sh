#!/bin/bash
# Bash Menu

DS_AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PS3="[Select an option from the list:]"
options=("NoProxy" "NRAProxy" "Zscaler Proxy" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "NoProxy")
            echo "**** Trendmicro install/configured No Proxy ****"
            source "$DS_AGENT_DIR/LinuxAgentDeploymentScript_NoProxy.sh"
            echo Completed
            echo
            break;;
        "NRAProxy")
            echo "**** Trendmicro install/configured NRA Proxy ****"
            source "$DS_AGENT_DIR/LinuxAgentDeploymentScript_NRAProxy.sh"
            echo Completed
            echo
            break;;
        "Zscaler Proxy")
            echo "**** Trendmicro install/configured Zscaler Proxy ****"
            source "$DS_AGENT_DIR/LinuxAgentDeploymentScript_ZscalerProxy.sh"
            echo Completed
            echo
            break;;
        "Quit") break;;
        *) echo "Invalid option";;
    esac
done

