DESCRIPTION = "Simple solution to upgrade the EMMC from the SD-Card automatically"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

SRC_URI = "	file://cylon_sweep.sh \
		file://emmc_system_upgrade_from_sd_card.sh \
		file://reset_led.sh \
		file://extlinux.conf \
		file://system-upgrade-startup.service \
		file://system-upgrade-startup.sh \
		"

S = "${WORKDIR}"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -m 0755 -d ${D}${prefix}/local/system-upgrade
    install -d ${D}/etc/systemd/system
    install -d ${D}${sysconfdir}/init.d
		
    install -m 0755 ${WORKDIR}/cylon_sweep.sh ${D}${prefix}/local/system-upgrade/
    install -m 0755 ${WORKDIR}/emmc_system_upgrade_from_sd_card.sh ${D}${prefix}/local/system-upgrade/
    install -m 0755 ${WORKDIR}/extlinux.conf ${D}${prefix}/local/system-upgrade/
    install -m 0755 ${WORKDIR}/reset_led.sh ${D}${prefix}/local/system-upgrade/
    install -m 0755 ${WORKDIR}/system-upgrade-startup.service ${D}/etc/systemd/system/
    install -m 0755 ${WORKDIR}/system-upgrade-startup.sh ${D}${sysconfdir}/init.d/
}

FILES:${PN} += "${prefix}/local/system-upgrade/"
