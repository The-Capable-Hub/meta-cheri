FILESEXTRAPATHS:prepend := "${THISDIR}/dbus:"
SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
"
