FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://panel-ili9881c.config \
             file://0001-Modified_driver_ili9881c_to_add_winstar_lcd.patch \
             file://0002-Modified_driver_ili9881c_to_add_winstar_lcd.patch \
             file://defconfig "

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "defconfig"
KERNEL_CONFIG_FRAGMENTS = "panel-ili9881c.config"
