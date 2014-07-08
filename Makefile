all: zip

zip-nogapps: rom
	rm -f out/release-nogapps.zip
	cd working && zip -r9 ../out/release-nogapps.zip * -x@../gapps-exclude.txt && cd ../out/ &&  zip -g release-nogapps.zip system/build.prop boot.img

zip: rom
	rm -f out/release.zip
	cd working && zip -r9 ../out/release.zip * && cd ../out/ &&  zip -g release-nogapps.zip system/build.prop boot.img

rom:
	mkdir -p out/system/
	make -C boot
	. scripts/buildinfo.sh > out/system/build.prop

clean:
	make -C boot clean
	rm -rf out/*