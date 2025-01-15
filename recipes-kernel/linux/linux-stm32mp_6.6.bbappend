FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://panel-ili9881c.config \
             file://defconfig "

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "defconfig"
KERNEL_CONFIG_FRAGMENTS = "panel-ili9881c.config"
