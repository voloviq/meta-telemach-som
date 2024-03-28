#!/bin/sh
CYLON_PID=""
./cylon_sweep.sh &
CYLON_PID=$(pgrep -f "cylon_sweep.sh" | xargs)
echo "Erasing EMMC memory 2.0 GiB"
dd if=/dev/zero of=/dev/mmcblk1 bs=32k count=64k
sync
echo "Programming prepared EMMC raw file into /dev/mmcblk1"
dd if=/usr/local/system-upgrade/FlashLayout_emmc_stm32mp157c-geze-gcw05-m4-firmware-mx-trusted-for-upgrade.raw of=/dev/mmcblk1 bs=8M conv=fdatasync status=progress
sync
echo "Unlock partition with tf-a boot section"
echo 0 > /sys/class/block/mmcblk1boot0/force_ro
echo 0 > /sys/class/block/mmcblk1boot1/force_ro
echo "Programming tf-a image to /dev/mmcblk1boot0 and /dev/mmcblk1boot1"
dd if=/usr/local/tf-a-stm32mp157c-geze-gcw05-m4-firmware-mx-emmc.stm32 of=/dev/mmcblk1boot0
dd if=/usr/local/tf-a-stm32mp157c-geze-gcw05-m4-firmware-mx-emmc.stm32 of=/dev/mmcblk1boot1
sync
echo "Mount boot partition on EMMC"
mkdir -p /mnt/emmc-card
mount /dev/mmcblk1p6 /mnt/emmc-card
echo "Copy corrected extlinux.conf into mmc1_extlinux location"
cp extlinux.conf /mnt/emmc-card/mmc1_extlinux/extlinux.conf
sync
umount /mnt/emmc-card
rm -rf /mnt/emmc-card
sleep 5
kill $CYLON_PID
./reset_led.sh

