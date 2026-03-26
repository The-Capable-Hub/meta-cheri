FILESEXTRAPATHS:prepend := "${THISDIR}/tcl:"
SRC_URI:append = " \
    file://cheribsd.patch;striplevel=0 \
"
