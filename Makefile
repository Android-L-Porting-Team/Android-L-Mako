all: zip

zip-nogapps: rom
	cd working && zip -r release-nogapps.zip * -x@../gapps-exclude.txt
	mv working/release-nogapps.zip .

zip: rom
	cd working && zip -r release.zip *
	mv working/release.zip .

rom:
	make -C boot

clean:
	make -C boot clean
	rm -f release.zip
