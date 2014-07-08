all: zip

zip-nogapps: rom
	rm -f out/release-nogapps.zip
	mkdir -p out
	cd working && zip -r9 ../out/release-nogapps.zip * -x@../gapps-exclude.txt
	cd tmp &&  zip -r9 ../out/release-nogapps.zip *

zip: zip-nogapps
	rm -f out/release.zip
	cp out/release-nogapps.zip out/release.zip
	cd working && zip -r9 ../out/release.zip * -i@../gapps-exclude.txt

rom:
	mkdir -p tmp/system/
	make -C boot
	cp boot/boot.img tmp/
	. scripts/buildinfo.sh > tmp/system/build.prop

clean:
	make -C boot clean
	rm -rf out
	rm -rf tmp
