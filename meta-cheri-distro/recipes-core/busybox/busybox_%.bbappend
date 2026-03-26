SRC_URI:remove = " \
   https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
   file://CVE-2021-42380.patch \
   file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
   file://CVE-2023-42363.patch \
   file://0001-awk-fix-precedence-of-relative-to.patch \
   file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
"

SRC_URI:prepend = " \
  git://${META_CHERI_BUSYBOX_REPO};protocol=${META_CHERI_BUSYBOX_PROTOCOL};branch=${META_CHERI_BUSYBOX_BRANCH} \
"
SRCREV = "4f8f5c3670c8fa87d373021fbafb0ca5de305613"
PV = "1.36.1+git"

S = "${WORKDIR}/git"
