require recipes-bsp/u-boot/u-boot-common.inc
require recipes-bsp/u-boot/u-boot.inc

# inherit uboot-extlinux-config

SUMMARY = "Cheri U-Boot recipe"

UBOOT_VERSION = "2024.10"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

EXTRA_OEMAKE:remove = 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'
EXTRA_OEMAKE:append = " CC='${CC}' LD='${LD}'"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRCREV = "${AUTOREV}"
PV = "${UBOOT_VERSION}+git${SRCPV}"
ERROR_QA:remove = "version-going-backwards"

SRC_URI = " \
    git://${META_CHERI_U_BOOT_REPO};protocol=${META_CHERI_U_BOOT_PROTOCOL};branch=${META_CHERI_U_BOOT_BRANCH} \
"

COMPATIBLE_MACHINE = "^qemu.*cheri$"

