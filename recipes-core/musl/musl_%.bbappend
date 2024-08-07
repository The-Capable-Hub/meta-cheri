SRC_URI:cheri = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/musl.git;protocol=${CODASIP_GIT_PROTOCOL};branch=cheri-bakewell \
"
SRCREV:cheri = "f126724e95c7a55d633d513481aa4d7550ba4e12"
BASEVER:cheri = "1.2.0"
LIC_FILES_CHKSUM:cheri = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"

DEPENDS:remove:cheri = "libgcc-initial"
DEPENDS:remove:cheri = "libssp-nonshared"

RDEPENDS:${PN}-dev:remove:cheri = "libssp-nonshared-staticdev"

CONFIGUREOPTS:cheri += " --enable-static --disable-shared"

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
