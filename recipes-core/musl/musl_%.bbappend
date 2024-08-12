FILESEXTRAPATHS:prepend := "${THISDIR}/musl:"

SRC_URI:cheri = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/musl.git;protocol=${CODASIP_GIT_PROTOCOL};branch=cheri-bakewell \
    file://non-cheri-ldso.patch \
"
BASEVER:cheri = "1.2.0"
SRCREV:cheri = "${AUTOREV}"
PV:cheri = "${BASEVER}+git${SRCPV}"

LIC_FILES_CHKSUM:cheri = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"

DEPENDS:remove:cheri = "libgcc-initial"
DEPENDS:append:cheri = " virtual/${TARGET_PREFIX}compilerlibs"
DEPENDS:remove:cheri = "libssp-nonshared"

RDEPENDS:${PN}-dev:remove:cheri = "libssp-nonshared-staticdev"

# musl Makefile uses
#   STRIP  = $(CROSS_COMPILE)strip
# which is the bfd strip, which fails with:
#   riscv64-codasip-linux-musl-strip: lib/libc.so.striped: not enough room for program headers, try linking with -N
# so force the use of llvm strip
EXTRA_OEMAKE += "STRIP=${STRIP}"

# musl builds with -nostdlib and -ffreestanding, so cannot access
# cheri_init_globals_bw.h directly. Copy it into the build for now
do_compile:prepend:cheri() {
  touch x.c
  $CC $CFLAGS --verbose -c x.c > log 2>&1
  for p in `sed -n '/include <...> search starts here/,/End of search list/s/^ //p' log` ; do
    echo $p
    c=$p/cheri_init_globals_bw.h
    [ -f "$c" ] && cp "$c" ${S}/include
  done
}
