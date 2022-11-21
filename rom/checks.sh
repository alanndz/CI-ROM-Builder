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

name_rom=$(grep init $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d / -f 4)
device=$(grep lunch $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)
branch_name=$(grep init $CIRRUS_WORKING_DIR/build.sh | awk -F "-b " '{print $2}' | awk '{print $1}')

echo ""
msg2 "Cek Keamanan"
echo "==============================="
if [[ "$CIRRUS_REPO_OWNER" == "NFS-Project" ]]; then
    msg Ok
elif [[ "$CIRRUS_REPO_OWNER" == "NFS86" ]]; then
    msg Ok
elif [[ "$CIRRUS_REPO_OWNER" == "AnGgIt88" ]]; then
    msg Ok
elif [[ "$CIRRUS_REPO_OWNER" == "c3eru" ]]; then
    msg Ok
elif [[ "$CIRRUS_REPO_OWNER" == "zacky46" ]]; then
    msg Ok
elif [[ "$CIRRUS_REPO_OWNER" == "IQ-7" ]]; then
    msg Ok
else
    msg1 maaf anda tidak di izinkan
    echo "==============================="
    exit 1
fi
echo "==============================="
echo ""
echo ""
msg2 "Building Rom Information"
echo "==============================="
msg "Rom Name = $name_rom"
msg "Branch = $branch_name"
msg "Devices = $device"
echo "==============================="
echo ""
if [[ "$CIRRUS_USER_PERMISSION" == "admin" ]]; then
    echo "==============================="
    msg Anda adalah admin, Anda bebas mwlakukan apa saja.
    echo "==============================="
fi
if [[ "$CIRRUS_USER_PERMISSION" == "write" ]]; then
    echo "==============================="
    msg2 Anda adalah user dengan izin menulis saja, Mungkin tindakan anda sedikit di batasi.
    echo "==============================="
fi
if [[ $CIRRUS_COMMIT_MESSAGE == "Update build_rom.sh" ]]; then msg2 Tulis lah nama commit nya, Males bener.; exit 1; fi; 
if [ -z "$CIRRUS_PR" ]; then echo fine; else
   echo "==============================="
   msg1 Maaf, Pull Request di tolak.
   echo "==============================="
   exit 1
fi
echo ""
msg2 "🔐 Notes"
echo "==============================="
msg3 "Untuk bisa menjadi bagian dari Team kami,
Anda bisa hubungi admin dalam grup telegram kami pada link di bawah ini:"
msg https://t.me/cri_grup
echo ""
msg2 "CR: NFS-Project"
echo "==============================="
