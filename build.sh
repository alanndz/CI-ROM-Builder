# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/BiancaProject/android.git -b 13-rebase-android-13.0.0_r38 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync --current-branch -j16
git clone --depth=1 https://${PAT_KEY}@github.com/chaldeaprjkt/device_xiaomi_vayu -b 13-dudu device/xiaomi/vayu
git clone --depth=1 https://${PAT_KEY}@github.com/chaldeaprjkt/vendor_xiaomi_vayu -b 13-dudu vendor/xiaomi/vayu
git clone --depth=1 https://github.com/aLnProject/device_xiaomi_vayu-kernel -b main device/xiaomi/vayu-kernel
git clone --depth=1 https://${PAT_KEY}@github.com/alanndz/certs -b main certs

# build rom
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device vayu --lunch vayu-user
./barom.sh -b -j 8 -u "wet sf" --timer 95m -- m dudu

# end
