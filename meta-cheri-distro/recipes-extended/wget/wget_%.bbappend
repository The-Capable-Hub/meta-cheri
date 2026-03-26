FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://Fixes-to-make-compilable-with-cheri.patch \
"
