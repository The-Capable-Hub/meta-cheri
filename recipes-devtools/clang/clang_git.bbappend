require common-cheri.inc

# Can't currently build lldb for CHERI
LLDB:cheri = ""

# No ld avilable, so default to lld
PACKAGECONFIG:class-native:append = " lld"
PACKAGECONFIG:class-nativesdk:append = " lld"

# Upstream still tries to install lldb-tblgen even when LLDB builds are disabled
do_install:prepend:class-native () {
    touch ${B}${BINPATHPREFIX}/bin/lldb-tblgen
}

# No binutils available
DEPENDS:remove = "binutils"
RDEPENDS:remove = "binutils"
RRECOMMENDS:${PN}:remove = "binutils"
EXTRA_OECMAKE:remove = "-DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR}"
