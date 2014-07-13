all: zip
all-with-custom-bootimg: zip-with-custom-bootimg

bootimg:
	mkdir -p tmp/system/
	make -C boot
	
zip-nogapps: rom
	rm -f out/release-nogapps.zip
	mkdir -p out
	cd working && zip -r9 ../out/release-nogapps.zip * -x@../gapps-exclude.txt
	cd tmp &&  zip -r9 ../out/release-nogapps.zip *

	
zip: zip-nogapps
	rm -f out/release.zip
	cp out/release-nogapps.zip out/release.zip
	cd working && zip -r9 ../out/release.zip * -i@../gapps-exclude.txt


rom: bootimg
	cp boot/boot.img tmp/
	. scripts/buildinfo.sh > tmp/system/build.prop

zip-with-custom-bootimg-nogapps: rom-with-custom-bootimg
	rm -f out/release-nogapps.zip
	mkdir -p out
	cd working && zip -r9 ../out/release-nogapps.zip * -x@../gapps-exclude.txt
	cd tmp &&  zip -r9 ../out/release-nogapps.zip *
	
zip-with-custom-bootimg: zip-with-custom-bootimg-nogapps
	rm -f out/release.zip
	cp out/release-nogapps.zip out/release.zip
	cd working && zip -r9 ../out/release.zip * -i@../gapps-exclude.txt	
	
mkbootimg:
	mkdir -p tmp/system/
	make mkbootimg -C boot		
	
rom-with-custom-bootimg: mkbootimg
	cp boot/boot.img tmp/
	. scripts/buildinfo.sh > tmp/system/build.prop
		
clean:
	make -C boot clean
	rm -rf out
	rm -rf tmp
