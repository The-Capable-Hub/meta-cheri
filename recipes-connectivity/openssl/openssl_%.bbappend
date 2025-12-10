RDEPENDS:${PN}-misc:remove = "perl"
RDEPENDS:${PN}-ptest:remove = "perl perl-modules bash"

EXTRA_OECONF:append:cheri = " no-asm"
