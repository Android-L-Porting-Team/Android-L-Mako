all: boot

initrd:
	abootimg-pack-initrd

boot: initrd
	abootimg --create boot.img -f bootimg.cfg -k zImage -r initrd.img
	cp boot.img ../working/

clean:
	rm -f boot.img
	rm -f initrd.img
