FILESEXTRAPATHS:prepend := "${THISDIR}/harfbuzz:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
"
