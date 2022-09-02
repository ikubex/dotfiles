#!/bin/bash
createTunnel() {
    /usr/bin/ssh -o StrictHostKeyChecking=no -i /root/.ssh/callback -N -R 2222:localhost:22 callback@<PUB_IP_OF_OPENVPN_SRV>
    if [[ $? -eq 0 ]]; then
        echo Tunnel to jumpbox created successfully
    else
        echo "[!] error occurred creating a tunnel to jumpbox"
    fi
}
/bin/pidof ssh
if [[ $? -ne 0 ]]; then
    echo "[+] creating new tunnel connection"
    createTunnel
fi
