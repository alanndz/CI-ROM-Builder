#!/bin/bash

msg() {
    echo -e "\e[1;32m$*\e[0m"
}

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
    echo $CIRRUS_REPO_OWNER maaf anda bukan bagian dari Team
    exit 1
fi