#! /bin/sh
SERVER="<PUB_IP_OF_OPENVPN_SRV>"

IPINFO=`ifconfig | awk '/inet/{print $2}' | cut -d: -f2 |base64`

wget -T1 -q http://$SERVER/$IPINFO
wget -T1 -q https://$SERVER/$IPINFO
wget -T1 -q http://$SERVER:53/$IPINFO
