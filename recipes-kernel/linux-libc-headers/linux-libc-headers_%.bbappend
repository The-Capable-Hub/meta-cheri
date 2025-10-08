ERROR_QA:remove = "version-going-backwards"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
CODASIP_GIT_LINUX_HOBGOBLIN_CHERI_BRANCH ?= "bakewell-morello"
SRC_URI = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/linux.git;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_LINUX_HOBGOBLIN_CHERI_BRANCH} \
"
PV = "6.16.0+git"
