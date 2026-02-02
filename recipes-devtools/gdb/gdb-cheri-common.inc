PV = "14.1+git"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
SRC_URI = " \
    git://${META_CHERI_GDB_REPO};protocol=${META_CHERI_GDB_PROTOCOL};branch=${META_CHERI_GDB_BRANCH} \
"
