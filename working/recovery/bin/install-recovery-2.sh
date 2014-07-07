#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:7755776:a654af206ff918f2c647d1363e248371fb7e3e9a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7198720:1c32b9e21284de196176122ba873a9a415fa29bf EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a654af206ff918f2c647d1363e248371fb7e3e9a 7755776 1c32b9e21284de196176122ba873a9a415fa29bf:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
