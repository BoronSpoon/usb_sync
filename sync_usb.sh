#!/bin/sh
mount_point=/home/pi/usb_sync/mnt/mnt
cd $mount_point/..
sleep 1
/bin/echo $mount_point > /home/pi/usb_sync/log
/usr/bin/rsync -acH --modify-window=1 $mount_point /home/pi/usb_sync/test
/bin/umount $mount_point
/usr/bin/python /home/pi/usb_sync/beep.py
