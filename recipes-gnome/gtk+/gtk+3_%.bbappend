FILESEXTRAPATHS:prepend := "${THISDIR}/gtk+3:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
