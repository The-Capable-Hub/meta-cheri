FILESEXTRAPATHS:prepend := "${THISDIR}/iptables:"
SRC_URI += " \
    file://Remove-unsupported-Wlogical-op-warning.patch \
    file://Update-linux-kernel-headers-to-our-UAPI-and-fix-comp.patch \
"
