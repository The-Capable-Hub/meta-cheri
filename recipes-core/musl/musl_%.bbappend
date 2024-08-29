FILESEXTRAPATHS:prepend := "${THISDIR}/musl:"

SRC_URI = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/musl.git;protocol=${CODASIP_GIT_PROTOCOL};branch=cheri-bakewell \
    file://non-cheri-ldso.patch \
"
BASEVER = "1.2.0"
SRCREV = "${AUTOREV}"
PV = "${BASEVER}+git${SRCPV}"

LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"

DEPENDS:remove = "libgcc-initial"
DEPENDS:append = " virtual/${TARGET_PREFIX}compilerlibs"
DEPENDS:remove = "libssp-nonshared"

RDEPENDS:${PN}-dev:remove = "libssp-nonshared-staticdev"

# musl Makefile uses
#   STRIP  = $(CROSS_COMPILE)strip
# which is the bfd strip, which fails with:
#   riscv64-codasip-linux-musl-strip: lib/libc.so.striped: not enough room for program headers, try linking with -N
# so force the use of llvm strip
EXTRA_OEMAKE += "STRIP=${STRIP}"

# musl builds with -nostdlib and -ffreestanding, so cannot access
# cheri_init_globals_bw.h directly. Copy it into the build for now
do_compile:prepend() {
  touch x.c
  $CC $CFLAGS --verbose -c x.c > log 2>&1
  for p in `sed -n '/include <...> search starts here/,/End of search list/s/^ //p' log` ; do
    echo $p
    c=$p/cheri_init_globals_bw.h
    [ -f "$c" ] && cp "$c" ${S}/include
  done
}

# musl installs stropts.h (support for STREAMS) which Linux doesn't support
# It also has a prototype for ioctl() which causes problems with clang.
# Rather than fix it, just remove it.
do_install:append() {
  find ${D}${includedir} -name stropts.h -exec rm {} \;
}