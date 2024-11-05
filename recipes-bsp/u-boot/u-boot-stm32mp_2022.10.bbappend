FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += " file://telemach-som-mx-trusted_defconfig \
			file://README \
			"
#			file://2021.01-winstar-wf50dtya3mng10-add.patch 
do_configure:prepend () {
	install -m 0644 ${WORKDIR}/telemach-som-mx-trusted_defconfig ${S}/configs
}

UBOOT_EXTERNAL_DEFCONFIG = "telemach-som-mx-trusted_defconfig"
