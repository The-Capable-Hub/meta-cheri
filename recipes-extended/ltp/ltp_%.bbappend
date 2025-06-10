SRC_URI = "git://git@gitlab.codasip.com/cheri/software/cherilinux/ltp.git;branch=bakewell-morello;protocol=ssh"
SRCREV = "${AUTOREV}"

# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN}:append = "ethtool modutils-initscripts kernel-base"
RDEPENDS:${PN}:remove = "python3-core perl"


LDFLAGS:remove = "-fuse-ld=bfd"
