FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SUMMARY            = "Simple capability test application"
DESCRIPTION        = "Simple capability test application"
LICENSE            = "MIT"
LIC_FILES_CHKSUM   = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    file://cheri-test.c \
    file://Makefile \
    "

do_configure:prepend () {
    install -d ${S}
    install ${WORKDIR}/Makefile ${S}
    install ${WORKDIR}/cheri-test.c ${S}
}

do_install () {
    install -d ${D}${bindir}
    install -m 755 ${S}/cheri-test ${D}${bindir}/cheri-test-${TARGET_SYS}
}

FILES:${PN} += "${bindir}"
