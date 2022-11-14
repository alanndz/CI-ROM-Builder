#!/bin/bash

# green
msg() {
    echo -e "\e[1;32m$*\e[0m"
}
# red
msg1() {
    echo -e "\e[1;31m$*\e[0m"
}
# yellow
msg2() {
    echo -e "\e[1;33m$*\e[0m"
}
# purple
msg3() {
    echo -e "\e[1;35m$*\e[0m"
}

sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
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
echo ""
echo ""
echo "==============================="
msg2 "🔐 Notes"
msg3 "Untuk bisa menjadi bagian dari Team kami,
Anda bisa hubungi admin dalam grup telegram kami pada link di bawah ini:"
msg https://t.me/cri_grup
echo ""
msg2 "CR: NFS-Project"
echo "==============================="
