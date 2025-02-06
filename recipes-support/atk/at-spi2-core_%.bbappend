FILESEXTRAPATHS:prepend := "${THISDIR}/at-spi2-core:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
