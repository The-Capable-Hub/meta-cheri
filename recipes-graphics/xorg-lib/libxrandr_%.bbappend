FILESEXTRAPATHS:prepend := "${THISDIR}/libxrandr:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
