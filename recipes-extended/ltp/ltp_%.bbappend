# Note this removes Yocto patches, do we want/need them?
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRCREV = "${AUTOREV}"
SRC_URI = " \
    git://git.morello-project.org/morello/morello-linux-ltp.git;branch=morello/master;protocol=https \
    file://cheri-fixes.patch \
    file://0001-tcindex01-fix-compilation-errors-due-to-missing-TCA_.patch \
    file://0002-cheri-Fix-compilation.patch \
    file://0003-Test-fixes.patch \
    file://cheri-Allow-SIGILL-instead-of-SIGSEGV.patch \
    file://cheri-Fix-some-tests.patch \
    file://Fix-off-by-one-error-in-pidns05.patch \
    file://clone3-fix-size-of-stack-member-in-tcase-struct \
    file://sbrk-disable-test-as-brk-is-not-supported-on-cheri \
"

SRC_URI:append:qemu-tweaks = " \
    file://qemu-Disable-some-tests-that-take-too-long-on-qemu.patch \
    file://qemu-Increase-timer-threshold.patch \
"


# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN}:append = "ethtool modutils-initscripts kernel-base"
RDEPENDS:${PN}:remove = "python3-core perl"


LDFLAGS:remove = "-fuse-ld=bfd"
