#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/PixelExperience/manifest -b twelve-plus -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS-Project/local_manifest --depth 1 -b rosy-PE-plus-12.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
export NFS_TARGET_BUILD_ROM=No Need
source build/envsetup.sh
lunch aosp_rosy-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=rosy
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=rosy
export BUILD_HOSTNAME=nfsproject
mka bacon -j8
# Switch to vanilla build
