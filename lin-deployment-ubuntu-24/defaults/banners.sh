#!/bin/bash

# Bash Menu

PS3="[Select an option from the list:]"
options=("1: Production" "2: UAT" "3: Quit")
select opt in "${options[@]}"
do
    case $opt in
        "1: Production")
            echo "**** Configuring banners ****"
            echo
            sleep 3

            echo > /etc/banner_ssh
            cat <<'EOF' | sudo tee /etc/banner_ssh
A.P. Moller's internal systems must only be used for conducting
A.P. Moller's business or for purposes authorized by A.P. Moller or
IT management.

You should be aware that it may be a criminal offence to secure
unauthorised access to any program or data in the system or
to make any unauthorised modification to its contents.

If you are not authorised by IT or IT management to access this
system, please LOGOFF now.

Use is subject to audit at any time by IT management.
Unauthorized use of this system is prohibited.
EOF

            #sudo sed -i 's/^#Banner none$/Banner /etc/banner_ssh/' /etc/ssh/sshd_config
            #sudo systemctl reload ssh.service

            echo > /etc/motd
            cat <<'EOF' | sudo tee /etc/motd
=====================================================================
_____  _____   ____  _____  _    _  _____ _______ _____ ____  _   _
|  __ \|  __ \ / __ \|  __ \| |  | |/ ____|__   __|_   _/ __ \| \ | |
| |__) | |__) | |  | | |  | | |  | | |       | |    | || |  | |  \| |
|  ___/|  _  /| |  | | |  | | |  | | |       | |    | || |  | | . ` |
| |    | | \ \| |__| | |__| | |__| | |____   | |   _| || |__| | |\  |
|_|    |_|  \_\\____/|_____/ \____/ \_____|  |_|  |_____\____/|_| \_|

=====================================================================

A.P. Moller's internal systems must only be used for conducting
A.P. Moller's business or for purposes authorized by A.P. Moller or
IT management.

You should be aware that it may be a criminal offence to secure
unauthorised access to any program or data in the system or
to make any unauthorised modification to its contents.

If you are not authorised by IT or IT management to access this
system, please LOGOFF now. Additionally, any operation that may
impact in the production service requires a Change Request
properly approved by CAB or ECAB.

Use is subject to audit at any time by IT management.
Unauthorized use of this system is prohibited.
EOF
            break;;
        "2: UAT")
             echo "**** Configuring banners ****"
            echo
            sleep 3
            
            echo > /etc/banner_ssh
            cat <<'EOF' | sudo tee /etc/banner_ssh
A.P. Moller's internal systems must only be used for conducting
A.P. Moller's business or for purposes authorized by A.P. Moller or
IT management.

You should be aware that it may be a criminal offence to secure
unauthorised access to any program or data in the system or
to make any unauthorised modification to its contents.

If you are not authorised by IT or IT management to access this
system, please LOGOFF now.

Use is subject to audit at any time by IT management.
Unauthorized use of this system is prohibited.
EOF

            #sudo sed -i 's/^#Banner none$/Banner /etc/banner_ssh/' /etc/ssh/sshd_config
            #sudo systemctl reload ssh.service

            echo > /etc/motd
            cat <<'EOF' | sudo tee /etc/motd
=====================================================================
                         _    _        _______
                        | |  | |   /\ |__   __|
                        | |  | |  /  \   | |
                        | |  | | / /\ \  | |
                        | |__| |/ ____ \ | |
                         \____//_/    \_\|_|

=====================================================================

A.P. Moller's internal systems must only be used for conducting
A.P. Moller's business or for purposes authorized by A.P. Moller or
IT management.

You should be aware that it may be a criminal offence to secure
unauthorised access to any program or data in the system or
to make any unauthorised modification to its contents.

If you are not authorised by IT or IT management to access this
system, please LOGOFF now. Additionally, any operation that may
impact in the production service requires a Change Request
properly approved by CAB or ECAB.

Use is subject to audit at any time by IT management.
Unauthorized use of this system is prohibited.            
EOF
            break;;
        "3: Quit") break;;
        *) echo "Invalid option";;
    esac
done
