inherit cheri-gnulib-fixes

FILESEXTRAPATHS:prepend := "${THISDIR}/coreutils:"
SRC_URI += " \
    file://disable-werror.patch \
"
