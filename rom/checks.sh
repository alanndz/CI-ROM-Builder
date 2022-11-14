#!/bin/bash

msg() {
    echo -e "\e[1;32m$*\e[0m"
}

msg1() {
    echo -e "\e[1;31m$*\e[0m"
}

msg2() {
    echo -e "\e[1;33m$*\e[0m"
}

echo ""
echo ""
msg2 "Check storage"
echo "==============================="
df -h
echo "==============================="
echo ""
echo ""
msg2 "Check swap"
echo "==============================="
free -h
echo "==============================="
echo ""
echo ""
msg2 "User Info"
echo "==============================="
if [[ "$CIRRUS_REPO_OWNER" == "NFS-Project" ]]; then
    msg $CIRRUS_REPO_OWNER Ok anda adalah bagian dari Team
elif [[ "$CIRRUS_REPO_OWNER" == "NFS86" ]]; then
    msg $CIRRUS_REPO_OWNER Ok anda adalah bagian dari Team
elif [[ "$CIRRUS_REPO_OWNER" == "AnGgIt88" ]]; then
    msg $CIRRUS_REPO_OWNER Ok anda adalah bagian dari Team
elif [[ "$CIRRUS_REPO_OWNER" == "c3eru" ]]; then
    msg $CIRRUS_REPO_OWNER Ok anda adalah bagian dari Team
elif [[ "$CIRRUS_REPO_OWNER" == "zacky46" ]]; then
    msg $CIRRUS_REPO_OWNER Ok anda adalah bagian dari Team
else
    msg1 $CIRRUS_REPO_OWNER maaf anda bukan bagian dari Team
    exit 1
fi
echo "==============================="
