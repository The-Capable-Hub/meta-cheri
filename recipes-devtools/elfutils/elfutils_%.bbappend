FILESEXTRAPATHS:prepend := "${THISDIR}/elfutils:"
SRC_URI:append = " \
    file://cheri-fixes.patch \
    file://elfutils-Fix-alignment-issues-to-make-it-compile.patch \
"
