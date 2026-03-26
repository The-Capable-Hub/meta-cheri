FILESEXTRAPATHS:prepend := "${THISDIR}/gmp:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
"

EXTRA_OECONF:append:class-target = " --enable-assembly=no"
