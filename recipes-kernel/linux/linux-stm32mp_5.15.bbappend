FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://telemach-som-mx_defconfig \
             file://winstar-wf50dtya3mng10-add.patch "

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "telemach-som-mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
