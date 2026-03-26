FILESEXTRAPATHS:prepend := "${THISDIR}/libffi:"
SRC_URI += " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-0.9.patch \
"
