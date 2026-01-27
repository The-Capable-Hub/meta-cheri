CODASIP_GIT_LLVM_CHERI_BRANCH ?= "matthis/bakewell-19.1.7"
BASEURI = "git://${CODASIP_GIT_BAKEWELL_REPO}/cherillvm.git;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_LLVM_CHERI_BRANCH};destsuffix=cherillvm-${RELEASE}"
SOURCEDIR = "cherillvm-${RELEASE}"
SRCREV ?= "${AUTOREV}"

FILESEXTRAPATHS:prepend := "${THISDIR}/clang:"
SRC_URI += " \
    file://morello_clang_h.patch \
"
