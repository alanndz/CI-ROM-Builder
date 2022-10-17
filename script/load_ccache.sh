#!/usr/bin/env bash

cd $WORKDIR
mkdir -p ~/.config/rclone
echo "$RCLONECONFIG_DRIVE" > ~/.config/rclone/rclone.conf
name_rom=$(grep init $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d / -f 4)
rclone copy --drive-chunk-size 256M --stats 1s NFS:ccache/$name_rom/ccache.tar.gz $WORKDIR -P
tar xzf ccache.tar.gz
rm -rf ccache.tar.gz
