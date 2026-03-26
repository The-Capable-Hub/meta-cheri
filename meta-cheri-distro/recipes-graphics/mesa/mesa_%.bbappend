FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-fixes.patch \
"

SRC_URI:append:class-target = " \
    file://libdrm-headers.patch;striplevel=0 \
"
