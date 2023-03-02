# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/BiancaProject/android.git -b 13 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://alanndz:${PAT_KEY}@github.com/chaldeaprjkt/device_xiaomi_vayu -b 13-dudu device/xiaomi/vayu
git clone --depth=1 https://alanndz:${PAT_KEY}@github.com/chaldeaprjkt/vendor_xiaomi_vayu -b 13-dudu vendor/xiaomi/vayu
git clone --depth=1 https://github.com/aLnProject/device_xiaomi_vayu-kernel -b main device/xiaomi/vayu-kernel
git clone --depth=1 https://alanndz:${PAT_KEY}@github.com/alanndz/certs -b main certs

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

. build/envsetup.sh
lunch vayu-user
mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
m dudu-sign -j16  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end
