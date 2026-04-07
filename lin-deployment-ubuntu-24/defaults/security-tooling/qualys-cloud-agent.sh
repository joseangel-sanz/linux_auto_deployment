#!/bin/bash

QUALYS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES_DIR="$QUALYS_DIR/../../files"

echo "**** qualys-cloud-agent install/configured ****"
echo
sleep 5
sudo dpkg --install "$FILES_DIR"/QualysCloudAgent*.deb
/usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=56304d81-63a4-4026-a034-9aba4a961b0b CustomerId=183554fa-0bc8-cb39-837d-10f521fe6a8b
 
cat <<'EOF' | sudo tee /etc/sysconfig/qualys-cloud-agent
https_proxy=http://10.255.237.21:8887
qualys_https_proxy=http://10.255.237.21:8887
EOF

echo "**** qualys-cloud-agent restart ****"
systemctl restart qualys-cloud-agent
sudo /usr/local/qualys/cloud-agent/bin/cloudagentctl.sh action=demand type=vm cputhrottle=0

echo Completed
echo