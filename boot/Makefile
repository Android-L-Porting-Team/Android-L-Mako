all: boot

initrd:
	rm -f initrd.img

	mkdir -p ramdisk/data
	mkdir -p ramdisk/dev
	mkdir -p ramdisk/proc
	mkdir -p ramdisk/sys

	chmod g-w ramdisk -R

	abootimg-pack-initrd

boot: initrd
	rm -f boot.img
	abootimg --create boot.img -f bootimg.cfg -k zImage -r initrd.img

clean:
	rm -f boot.img
	rm -f initrd.img
	rm -f new-ramdisk.cpio.gz

mkbootimg:
	rm -f boot.img
	rm -f new-ramdisk.cpio.gz
	repack_ramdisk ramdisk/
	mkbootimg --kernel zImage --ramdisk new-ramdisk.cpio.gz  --board mako --pagesize 2048 --base 0x80200000 --ramdiskaddr 0x81800000  --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=mako lpj=67677 user_debug=31' -o boot.img

	