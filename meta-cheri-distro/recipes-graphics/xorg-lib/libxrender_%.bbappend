FILESEXTRAPATHS:prepend := "${THISDIR}/libxrender:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
"
