FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "git://git@gitlab.codasip.com/cheri/software/cherilinux/ltp.git;branch=bakewell-morello;protocol=ssh \
           file://run_ltp_tests.sh \
          "
SRCREV = "${AUTOREV}"

# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN}:append = "ethtool modutils-initscripts kernel-base"
RDEPENDS:${PN}:remove = "python3-core perl"


LDFLAGS:remove = "-fuse-ld=bfd"

do_install:append () {
    install -d ${D}/home/root/ltp
    install -Dm0755 ${WORKDIR}/run_ltp_tests.sh ${D}/usr/bin/run_ltp_tests
}

FILES:${PN} += "/home/root/ltp /usr/bin/run_ltp_tests"
