#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/PixelExperience/manifest -b twelve-plus -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS-Project/local_manifest --depth 1 -b rosy-PE-plus-12.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

source build/envsetup.sh
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=rosy
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=rosy
export BUILD_HOSTNAME=nfsproject
lunch aosp_rosy-userdebug
mkfifo reading # Jangan di Hapus
tee "${BUILDLOG}" < reading & # Jangan di Hapus
build_message "Building Started" # Jangan di Hapus
progress & # Jangan di Hapus
mka bacon -j8  > reading # Jangan di hapus text line (> reading)

retVal=$?
timeEnd
statusBuild
# end
