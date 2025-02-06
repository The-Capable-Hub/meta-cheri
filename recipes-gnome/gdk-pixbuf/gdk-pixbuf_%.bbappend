FILESEXTRAPATHS:prepend := "${THISDIR}/gdk-pixbuf:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
