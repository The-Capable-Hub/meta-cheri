SRC_URI = " \
    git://${CODASIP_GIT_REPO}/bakewell/musl-libc.git;protocol=${CODASIP_GIT_PROTOCOL};branch=bakewell \
"
BASEVER = "1.2.0"
SRCREV = "${AUTOREV}"
PV = "${BASEVER}+git${SRCPV}"

LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b03f1cc25363d094011f8f4fd8bcfb68"

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

  # Because we specify --sysroot when cross compiling, $sysroot/usr/include
  # ends up on the include search path before the compiler's own
  # $sysroot-native/usr/lib/clang/15.0.0/include which causes problems with
  # files such as stddef.h where we want the compiler version (for ptraddr_t
  # for example).
  # So delete the musl provided headers and rely on the compiler provided
  # ones.
  # Note we leave a couple in place (inttypes.h, limits.h) because the
  # compiler provided ones are incomplete and would rely on picking up the
  # system provided ones using #include_next, but this work because
  # the include path ordering is wrong.
  rm ${D}${includedir}/{float,iso646,stdalign,stdarg,stdbool,stddef,stdint,stdnoreturn,tgmath}.h

  rm ${D}/usr/share/revisions.txt
  rmdir ${D}/usr/share/
}
