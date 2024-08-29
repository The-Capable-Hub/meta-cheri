# Note this package has to be called *-initial so that it matches
# an expression in staging.bbclass which skips dependant installs

SUMMARY = "Header files to keep compiler-rt build happy"
HOMEPAGE = "http://www.musl-libc.org/"
LICENSE = "MIT"
SECTION = "libs"

SRC_URI = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/musl.git;protocol=${CODASIP_GIT_PROTOCOL};branch=cheri-bakewell \
"
BASEVER = "1.2.0"
SRCREV = "${AUTOREV}"
PV = "${BASEVER}+git${SRCPV}"
LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"

S = "${WORKDIR}/git"

INHIBIT_DEFAULT_DEPS = "1"
DEPENDS = "virtual/${TARGET_PREFIX}binutils \
	   clang-cross-${TARGET_ARCH} \
	   linux-libc-headers \
           bsd-headers \
	  "

# Copied from libgcc-initial.inc
PACKAGES = ""
inherit nopackages
deltask do_build

export CROSS_COMPILE="${TARGET_PREFIX}"

CONFIGUREOPTS = " \
    --prefix=${prefix} \
    --exec-prefix=${exec_prefix} \
    --bindir=${bindir} \
    --libdir=${libdir} \
    --includedir=${includedir} \
    --syslibdir=${nonarch_base_libdir} \
"

do_configure() {
	${S}/configure ${CONFIGUREOPTS}
}

do_compile() {
	:
}

do_install() {
	oe_runmake install-headers DESTDIR='${D}'
}
