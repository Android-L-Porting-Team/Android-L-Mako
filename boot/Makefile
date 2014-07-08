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
	cp boot.img ../working/

clean:
	rm -f boot.img
	rm -f initrd.img
