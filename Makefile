PACKAGE_NAME="acer-wmi-battery"
PACKAGE_VERSION=1.0
DIR=${shell pwd}

debian: ${PACKAGE_NAME}.deb

${PACKAGE_NAME}.deb:
	mkdir -p usr/src/${PACKAGE_NAME}-${PACKAGE_VERSION}
	cp -rl src usr/src/${PACKAGE_NAME}-${PACKAGE_VERSION}
	ln dkms.conf usr/src/${PACKAGE_NAME}-${PACKAGE_VERSION}
	dpkg-deb --build --root-owner-group ${DIR}
	mv ../${PACKAGE_NAME}.deb ${DIR}
	rm -r usr

clean:
	rm ${PACKAGE_NAME}.deb
