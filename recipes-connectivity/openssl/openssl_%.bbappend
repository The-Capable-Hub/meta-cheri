FILESEXTRAPATHS:prepend := "${THISDIR}/openssl:"
RDEPENDS:${PN}-misc:remove = "perl"
RDEPENDS:${PN}-ptest:remove = "perl perl-modules bash"

SRC_URI += " \
	file://syscall.patch \
"
