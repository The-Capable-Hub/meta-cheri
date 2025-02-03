FILESEXTRAPATHS:prepend := "${THISDIR}/elfutils:"
SRC_URI:append = " \
    file://cheri-fixes.patch \
"
