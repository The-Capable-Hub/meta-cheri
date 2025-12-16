CODASIP_GIT_LTP_CHERI_BRANCH ?= "bakewell-morello"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "git://${CODASIP_GIT_CHERILINUX_REPO}/ltp.git;branch=${CODASIP_GIT_LTP_CHERI_BRANCH};protocol=${CODASIP_GIT_PROTOCOL} \
           file://run_ltp_tests.sh \
          "
SRCREV = "${AUTOREV}"

# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN}:append = "ethtool modutils-initscripts kernel-base"
RDEPENDS:${PN}:remove = "python3-core"


LDFLAGS:remove = "-fuse-ld=bfd"

do_install:append () {
    install -d ${D}/home/root/ltp
    install -Dm0755 ${WORKDIR}/run_ltp_tests.sh ${D}/usr/bin/run_ltp_tests
}

# Overwrite "remove_broken_musl_sources" patch function of Poky recipe as we
# fixed the compilation and either run or intentionally skip these tests.
do_patch[postfuncs] = ""

FILES:${PN} += "/home/root/ltp /usr/bin/run_ltp_tests"
