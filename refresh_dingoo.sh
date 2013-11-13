#!/bin/sh

WD=`pwd`

./mount_dingoo.sh

TARGET=/mnt/dingoo/GAME/nlove/games/
DEV=/home/seppi/dingoo/nlovedev/src/

rm ${TARGET}dev.love

cd ${DEV}

zip -r ${TARGET}dev.love *

cd $WD

./umount_dingoo.sh
