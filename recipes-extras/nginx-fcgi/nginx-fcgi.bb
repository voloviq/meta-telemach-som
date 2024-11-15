#
# This file was derived from the 'nginx-fcgi' recipe in the
# Yocto Project Development Manual.
#

SUMMARY = "Nginx fcgi example"
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "	file://main.c "

S = "${WORKDIR}"

DEPENDS = "fcgi"

LDFLAGS='-L=/usr/lib -lfcgi'

LIBS += "fcgi"

do_compile() {
		${CC} ${LDFLAGS} -c main.c
	    ${CC} ${LDFLAGS} main.o -o nginx-fcgi
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 nginx-fcgi ${D}${bindir}
}
