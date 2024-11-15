DESCRIPTION = "LoRa Packet Forwarder"
HOMEPAGE = "https://github.com/lora-net/packet_forwarder"
PRIORITY = "optional"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=22af7693d7b76ef0fc76161c4be76c45"
DEPENDS = "lora-gateway"
PR = "r5"

RDEPENDS:${PN} += "bash"

#SRCREV = "v${PV}"
SRCREV = "d0226eae6e7b6bbaec6117d0d2372bf17819c438"
SRC_URI = "git://github.com/Lora-net/packet_forwarder.git;protocol=https;branch=master \
           file://Makefile-pk \
           file://reset_pkt_fwd.sh \
           file://Makefile \
           file://global_conf.json \
           file://local_conf.json \
           file://lora-packet-forwarder-startup.sh \
           file://lora_pkt_fwd \
           file://reset_lgw.sh \
"

S = "${WORKDIR}/git"
LORA_DIR = "/opt/lora-packet-forwarder"

export LGW_PATH = "${STAGING_LIBDIR}/lora"
export LGW_INC = "${STAGING_INCDIR}/lora"
CFLAGS += "-I${STAGING_INCDIR}/lora -Iinc -I."

do_configure:append() {
    cp ${WORKDIR}/Makefile-pk ${S}/lora_pkt_fwd/Makefile;
    cp ${WORKDIR}/Makefile ${S}/Makefile;
    cp ${WORKDIR}/reset_pkt_fwd.sh ${S}/lora_pkt_fwd/reset_pkt_fwd.sh;
    cp ${WORKDIR}/global_conf.json ${S}/lora_pkt_fwd/global_conf.json;
    cp ${WORKDIR}/local_conf.json ${S}/lora_pkt_fwd/local_conf.json;
    cp ${WORKDIR}/lora-packet-forwarder-startup.sh ${S}/lora_pkt_fwd/lora-packet-forwarder-startup.sh;
    cp ${WORKDIR}/reset_lgw.sh ${S}/lora_pkt_fwd/reset_lgw.sh;
}

do_compile() {
    oe_runmake
}

do_install() {
    install -d ${D}${LORA_DIR}
    install -d ${D}${LORA_DIR}/utils

    #install -m 0755 lora_pkt_fwd/lora_pkt_fwd ${D}${LORA_DIR}/
    install -m 0755 lora_pkt_fwd/local_conf.json ${D}${LORA_DIR}/
    install -m 0755 lora_pkt_fwd/global_conf.json ${D}${LORA_DIR}/
    install -m 0755 lora_pkt_fwd/reset_pkt_fwd.sh ${D}${LORA_DIR}/

    install -m 0755 util_sink/util_sink ${D}${LORA_DIR}/utils/
    install -m 0755 util_ack/util_ack ${D}${LORA_DIR}/utils/
    install -m 0755 util_tx_test/util_tx_test ${D}${LORA_DIR}/utils/

    install -m 0755 ${S}/lora_pkt_fwd/reset_lgw.sh ${D}${LORA_DIR}/
    install -m 0755 ${S}/lora_pkt_fwd/lora-packet-forwarder-startup.sh ${D}${LORA_DIR}/
    cp ${WORKDIR}/lora_pkt_fwd ${S}/lora_pkt_fwd/lora_pkt_fwd;
    install -m 0755 ${S}/lora_pkt_fwd/lora_pkt_fwd  ${D}${LORA_DIR}/
    install -m 0755 ${S}/lora_pkt_fwd/local_conf.json  ${D}${LORA_DIR}/
    install -m 0755 ${S}/lora_pkt_fwd/global_conf.json  ${D}${LORA_DIR}/
}

FILES:${PN} += "${LORA_DIR}"
FILES:${PN}-dbg += "${LORA_DIR}/.debug ${LORA_DIR}/utils/.debug"

INSANE_SKIP:${PN} = "ldflags"
