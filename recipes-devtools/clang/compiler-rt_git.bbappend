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

# Adding libatomic to a baremetal build breaks it, as it appears
# __builtin_memcpy() still expands to a call to memcpy(), but the
# code is linked with -nostdlib to avoid needing libc.
# So for now only enable it for musl (i.e. poky) builds.
EXTRA_OECMAKE:append:libc-musl = " -DCOMPILER_RT_BUILD_STANDALONE_LIBATOMIC=ON"

COMPATIBLE_HOST = "${HOST_SYS}"
