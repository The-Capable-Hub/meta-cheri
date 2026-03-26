FILESEXTRAPATHS:prepend := "${THISDIR}/libdrm:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
    file://cheribsd_fixup.patch;striplevel=1 \
"
