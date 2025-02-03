FILESEXTRAPATHS:prepend := "${THISDIR}/icu:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
"
