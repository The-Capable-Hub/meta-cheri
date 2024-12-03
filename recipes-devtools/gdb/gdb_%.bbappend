PACKAGECONFIG:remove = "python"
DEPENDS:remove = "lttng-ust"
DEPENDS:append = " mpfr"
TOOLCHAIN = "clang"

PV = "14.1+git"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
CODASIP_GIT_GDB_CHERI_BRANCH ?= "bakewell"
CODASIP_GIT_GDB_BRANCH = "${CODASIP_GIT_GDB_CHERI_BRANCH}"
SRC_URI = " \
    git://${CODASIP_GIT_REPO}/bakewell/cheri-gdb.git;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_GDB_BRANCH} \
"
