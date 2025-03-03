FILESEXTRAPATHS:prepend := "${THISDIR}/iptables:"
SRC_URI += " \
    file://Remove-unsupported-Wlogical-op-warning.patch \
    file://Update-linux-kernel-headers-to-out-UAPI-and-fix-comp.patch \
"
