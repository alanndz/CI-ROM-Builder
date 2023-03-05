#!/usr/bin/env bash

function upload_ccache() {
cd $WORKDIR
com ()
{
  tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}
time com ccache 1
rclone copy --drive-chunk-size 256M --stats 1s ccache.tar.gz zendrive:ccache/$name_rom -P
rm -rf ccache.tar.gz
}

upload_ccache