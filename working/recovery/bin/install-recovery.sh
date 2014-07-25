#!/system/bin/sh
# init.d support
busybox run-parts /system/etc/init.d/
/system/xbin/su --daemon &
/system/bin/install-recovery-2.sh
