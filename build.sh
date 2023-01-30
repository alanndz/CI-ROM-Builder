# sync rom
repo init --depth=1 --no-repo-verify -u ssh://git@github.com/Nusantara-ROM/android_manifest.git -b 13 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 ssh://git@github.com/ZenkaBestia/device_xiaomi_lmi-a13.git -b 13-nad-sun device/xiaomi/lmi
git clone --depth=1 ssh://git@github.com/ZenkaBestia/vendor_xiaomi_lmi-a13.git -b 13-nad-sun vendor/xiaomi/lmi
git clone --depth=1 ssh://git@github.com/ZenkaBestia/kernel_xiaomi_lmi-a13.git -b zen_plus-13 kernel/xiaomi/lmi

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

. build/envsetup.sh
lunch nad_lmi-user
mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
mka nad -j16  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end
