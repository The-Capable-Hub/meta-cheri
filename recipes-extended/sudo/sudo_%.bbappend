FILESEXTRAPATHS:prepend := "${THISDIR}/sudo:"
SRC_URI += " \
    file://sudo-ptrace-args.patch \
"
