SRC_URI:remove = " \
   https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
"

SRC_URI:prepend = " \
  git://git@gitlab.codasip.com/cheri/software/cherilinux/busybox;protocol=ssh;branch=1_36_1_cheri_yocto \
"
SRCREV = "4f8f5c3670c8fa87d373021fbafb0ca5de305613"
PV = "1.36.1"

S = "${WORKDIR}/git"
