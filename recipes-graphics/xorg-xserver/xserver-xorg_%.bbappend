FILESEXTRAPATHS:prepend := "${THISDIR}/xserver-xorg:"
SRC_URI:append = " \
    file://cheribsd.patch;striplevel=0 \
    file://libdrm-cheri-fixes.patch \
"
