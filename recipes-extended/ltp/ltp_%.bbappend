# Note this removes Yocto patches, do we want/need them?
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = " \
    git://git.morello-project.org/morello/morello-linux-ltp.git;branch=morello/master;protocol=https \
    file://cheri-fixes.patch \
"

# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN} = ""


LDFLAGS:remove = "-fuse-ld=bfd"
