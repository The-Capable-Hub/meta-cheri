FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
