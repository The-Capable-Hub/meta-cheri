FILESEXTRAPATHS:prepend := "${THISDIR}/glib-2.0:"
SRC_URI:append = " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-fixes.patch \
"

CFLAGS:append:class-target = " -DG_ENABLE_EXPERIMENTAL_ABI_COMPILATION"

# As we do not build python3 for CHERI, makes no sense to ship the script that's using it
do_install:append:cheri() {
        rm -f ${D}${bindir}/gtester-report
}

CODEGEN_PYTHON_RDEPENDS:cheri = ""
