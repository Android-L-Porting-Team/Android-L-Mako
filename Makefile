all: zip

zip: rom
	cd working && zip -r release.zip *
	mv working/release.zip .

rom:
	make -C boot

clean:
	make -C boot clean
	rm -f release.zip
