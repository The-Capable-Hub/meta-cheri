# Note this removes Yocto patches, do we want/need them?
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRCREV = "${AUTOREV}"
SRC_URI = " \
    git://git.morello-project.org/morello/morello-linux-ltp.git;branch=morello/master;protocol=https \
    file://cheri-fixes.patch \
    file://0001-tcindex01-fix-compilation-errors-due-to-missing-TCA_.patch \
    file://0002-cheri-Fix-compilation.patch \
    file://0003-Test-fixes.patch \
    file://0004-hugemmap-Workaround-for-LLVM-miscompilation.patch \
"

# Yocto has a massive dependency list, hopefully many of them are optional, but as many aren't yet
# built for CHERI remove them so we can work out what is and what isn't mandatory,
RDEPENDS:${PN} = ""


LDFLAGS:remove = "-fuse-ld=bfd"
