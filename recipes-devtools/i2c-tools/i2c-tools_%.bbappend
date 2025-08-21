# No perl on CHERI yet
RDEPENDS:${PN}-misc = "${PN}"
INSANE_SKIP:${PN}-misc += "file-rdeps"
