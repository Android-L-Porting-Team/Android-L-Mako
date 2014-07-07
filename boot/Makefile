all: boot

initrd:
	rm -f initrd.img
	abootimg-pack-initrd

boot: initrd
	rm -f boot.img
	abootimg --create boot.img -f bootimg.cfg -k zImage -r initrd.img
	cp boot.img ../working/

clean:
	rm -f boot.img
	rm -f initrd.img
