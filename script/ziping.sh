#!/usr/bin/env bash

name_rom=$(grep init $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d / -f 4)
device=$(grep lunch $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d ' ' -f 3)

function upload_ccache() {
cd $WORKDIR
com ()
{
  tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}
time com ccache 1
rclone copy --drive-chunk-size 256M --stats 1s ccache.tar.gz zendrive:ccache -P
rm -rf ccache.tar.gz
}

upload_ccache