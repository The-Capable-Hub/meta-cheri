ERROR_QA:remove = "version-going-backwards"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
SRC_URI = " \
    git://${META_CHERI_LINUX_REPO};protocol=${META_CHERI_LINUX_PROTOCOL};branch=${META_CHERI_LINUX_BRANCH} \
"
PV = "6.18.0+git"
