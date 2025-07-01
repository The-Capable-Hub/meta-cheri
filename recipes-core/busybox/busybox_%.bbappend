SRC_URI:remove = " \
   https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
"

CODASIP_GIT_BUSYBOX_CHERI_BRANCH ?= "1_36_1_cheri_yocto"
CODASIP_GIT_BUSYBOX_BRANCH = "${CODASIP_GIT_BUSYBOX_CHERI_BRANCH}"
SRC_URI:prepend = " \
  git://${CODASIP_GIT_CHERILINUX_REPO}/busybox.git;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_BUSYBOX_BRANCH} \
"
SRCREV = "4f8f5c3670c8fa87d373021fbafb0ca5de305613"
PV = "1.36.1+git"

S = "${WORKDIR}/git"
