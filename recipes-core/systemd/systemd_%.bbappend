FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"
SRC_URI += " \
    file://0001-basic-add-pidfs-magic-31709.patch \
    file://0002-basic-add-bcachefs-magic.patch \
"
