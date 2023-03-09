# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/BiancaProject/android.git -b 13 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://${PAT_KEY}@github.com/chaldeaprjkt/device_xiaomi_whyred -b t44 device/xiaomi/whyred
git clone --depth=1 https://${PAT_KEY}@github.com/chaldeaprjkt/vendor_xiaomi_whyred -b t44 vendor/xiaomi
git clone --depth=1 https://github.com/Mocaness/device_xiaomi_whyred-kernel -b t44 device/xiaomi/whyred-kernel
git clone --depth=1 https://${PAT_KEY}@github.com/Mocaness/keys-dev -b master certs
git clone --depth=1 https://${PAT_KEY}@github.com/Mocaness/vendor_scrapyard -b 13 vendor/scrapyard
git clone --depth=1 https://github.com/LineageOS/android_packages_apps_Aperture -b lineage-20.0 packages/apps/Aperture
git clone --depth=1 https://github.com/Mocarafee/device_bloatware -b nad_s device/bloatware

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device whyred --lunch whyred-user
./barom.sh -b -j 8 -u wet --timer 95m -- m dudu

# end
