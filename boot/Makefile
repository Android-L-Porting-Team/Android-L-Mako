all: boot

initrd:
	rm -f initrd.img

	mkdir -p ramdisk/data
	mkdir -p ramdisk/dev
	mkdir -p ramdisk/proc
	mkdir -p ramdisk/sys
	chmod -R 755 ramdisk
	chmod g-w ramdisk -R

	abootimg-pack-initrd

boot: initrd
	rm -f boot.img
	abootimg --create boot.img -f bootimg.cfg -k zImage -r initrd.img

clean:
	rm -f boot.img
	rm -f initrd.img
