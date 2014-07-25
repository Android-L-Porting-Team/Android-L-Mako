# init.d support
busybox run-parts /system/etc/init.d/
#!/system/bin/sh
/system/xbin/su --daemon &
/system/bin/install-recovery-2.sh
