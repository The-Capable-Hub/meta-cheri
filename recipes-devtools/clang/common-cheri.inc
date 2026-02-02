BASEURI = "git://${META_CHERI_LLVM_PROJECT_REPO};protocol=${META_CHERI_LLVM_PROJECT_PROTOCOL};branch=${META_CHERI_LLVM_PROJECT_BRANCH};destsuffix=cherillvm-${RELEASE}"
SOURCEDIR = "cherillvm-${RELEASE}"
SRCREV ?= "${AUTOREV}"
ERROR_QA:remove = "version-going-backwards"

FILESEXTRAPATHS:prepend := "${THISDIR}/clang:"
SRC_URI += " \
    file://morello_clang_h.patch \
"

MAJOR_VER = "19"
MINOR_VER = "0"
PATCH_VER = "0"
