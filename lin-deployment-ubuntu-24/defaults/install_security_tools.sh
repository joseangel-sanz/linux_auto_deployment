#!/bin/bash

# Get the directory where this script is located
SECURITY_TOOLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Bash Menu

PS3="[Select an option from the list:]"
options=("All" "ds-agent" "falcon-sensor" "qualys-cloud-agent" "5: Quit")
select opt in "${options[@]}"
do
    case $opt in
        "All")
            source "$SECURITY_TOOLS_DIR/security-tooling/ds-agent.sh"
            sleep 3
            source "$SECURITY_TOOLS_DIR/security-tooling/falcon-sensor.sh"
            sleep 3
            source "$SECURITY_TOOLS_DIR/security-tooling/qualys-cloud-agent.sh"
            sleep 3
            break;;

        "ds-agent")
            source "$SECURITY_TOOLS_DIR/security-tooling/ds-agent.sh"
            sleep 3
            break;;

        "falcon-sensor")
            source "$SECURITY_TOOLS_DIR/security-tooling/falcon-sensor.sh"
            sleep 3
            break;;

        "qualys-cloud-agent")
            source "$SECURITY_TOOLS_DIR/security-tooling/qualys-cloud-agent.sh"
            sleep 3
            break;;

        "Quit") break;;
        *) echo "Invalid option";;
    esac
done