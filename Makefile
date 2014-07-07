all: zip

zip-nogapps: rom
	. scripts/buildinfo.sh > working/system/build.prop
	cd working && zip -r9 release-nogapps.zip * -x@../gapps-exclude.txt
	mv working/release-nogapps.zip .

zip: rom
	. scripts/buildinfo.sh > working/system/build.prop
	cd working && zip -r9 release.zip *
	mv working/release.zip .

rom:
	make -C boot

clean:
	make -C boot clean
	rm -f release.zip
	rm -f release-nogapps.zip
