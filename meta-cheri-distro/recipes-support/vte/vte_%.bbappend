# gnutls hasn't yet been adapted for cheri
PACKAGECONFIG:remove = "gnutls"
EXTRA_OEMESON:append = " -D_b_symbolic_functions=false"

FILESEXTRAPATHS:prepend := "${THISDIR}/vte:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
