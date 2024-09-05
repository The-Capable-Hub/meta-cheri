# meta-clang compiler-rt is adding dependencies on gcc libraries, but we do not
# build them
DEPENDS:remove = "libgcc"
DEPENDS:remove:class-target = "gcc-runtime"

# Remove circular dependency.
# compiler-rt needs header files from libc, but not libc.a itself, while
# musl needs compiler-rt.a to link libc.so.
DEPENDS:remove:class-target = "virtual/${MLPREFIX}libc"
DEPENDS:append:class-target = " musl-initial"

# meta-clang compiler-rt is adding dependencies on gcc libraries, but we do not
# build them
LDFLAGS:remove = "-unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++"
LDFLAGS:append = " -nostdlib"

# Use compiler-rt as the cmake source path
OECMAKE_SOURCEPATH = "${S}/compiler-rt"

# meta-clang has this but commented out
PROVIDES:append:class-target = "\
        virtual/${TARGET_PREFIX}compilerlibs \
        "

EXTRA_OECMAKE:append = " -DCOMPILER_RT_BUILD_STANDALONE_LIBATOMIC=ON"

COMPATIBLE_HOST = "${HOST_SYS}"

# The clang compiler driver is adding -lunwind and -lssp_nonshared
# to the link line. Eventually libunwind should come from libcxx.
#
# Not sure if this is a version issue, but clang 15 is installing into
#   /usr/lib/linux/libclang_rt.builtins-riscv64.a
# Note we need to cope with HOST_OS="linux-musl"
do_install:append () {
    case "${HOST_OS}" in
    linux-*)
	if [ -e ${D}${libdir}/linux ]; then
	   d=${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
	   mkdir -p $d
	   mv ${D}${libdir}/linux $d
	fi
    ;;
    esac
}