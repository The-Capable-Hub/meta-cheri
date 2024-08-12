# meta-clang compiler-rt is adding dependencies on gcc libraries, but we do not
# build them
DEPENDS:remove:cheri = "libgcc"
DEPENDS:remove:cheri:class-target = "gcc-runtime"

# Remove circular dependency.
# compiler-rt needs header files from libc, but not libc.a itself, while
# musl needs compiler-rt.a to link libc.so.
DEPENDS:remove:class-target = "virtual/${MLPREFIX}libc"
DEPENDS:append:class-target = " musl-initial"

# meta-clang compiler-rt is adding dependencies on gcc libraries, but we do not
# build them
LDFLAGS:remove:cheri = "-unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++"
LDFLAGS:append:cheri = " -nostdlib"

# Use compiler-rt as the cmake source path
OECMAKE_SOURCEPATH:cheri = "${S}/compiler-rt"

# meta-clang has this but commented out
PROVIDES:append:cheri:class-target = "\
        virtual/${TARGET_PREFIX}compilerlibs \
        "

COMPATIBLE_HOST:cheri = "${HOST_SYS}"

# The clang compiler driver is adding -lunwind and -lssp_nonshared
# to the link line. Eventually libunwind should come from libcxx.
#
# Not sure if this is a version issue, but clang 15 is installing into
#   /usr/lib/linux/libclang_rt.builtins-riscv64.a
# Note we need to cope with HOST_OS="linux-musl"
do_install:append:cheri () {
    case "${HOST_OS}" in
    linux-*)
	if [ -e ${D}${libdir}/linux ]; then
	   d=${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
	   mkdir -p $d
	   mv ${D}${libdir}/linux $d
	fi
    ;;
    esac

    touch unwind.c
    ${CC} -c unwind.c
    ${AR} q ${D}${libdir}/libunwind.a unwind.o
}