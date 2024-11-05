FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://telemach-som-mx_defconfig "

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "telemach-som-mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
