all: zip

zip-nogapps: rom
	rm -f release-nogapps.zip
	cd working && zip -r9 release-nogapps.zip * -x@../gapps-exclude.txt
	mv working/release-nogapps.zip .

zip: rom
	rm -f release.zip
	cd working && zip -r9 release.zip *
	mv working/release.zip .

rom:
	make -C boot
	. scripts/buildinfo.sh > working/system/build.prop

clean:
	make -C boot clean
	rm -f release.zip
	rm -f release-nogapps.zip
	rm -f working/system/build.prop
