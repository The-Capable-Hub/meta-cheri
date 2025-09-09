inherit cheri-gnulib-fixes
FILESEXTRAPATHS:prepend := "${THISDIR}/grep:"
SRC_URI += " \
        file://cheri-Fix-rawmemchr.patch \
"

