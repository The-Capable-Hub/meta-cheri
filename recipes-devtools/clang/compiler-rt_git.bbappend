# meta-clang compiler-rt is adding dependencies on gcc libraries, but we do not
# build them
DEPENDS:remove = "libgcc"
DEPENDS:remove:class-target = "gcc-runtime"

# Remove circular dependency.
# compiler-rt needs header files from libc, but not libc.a itself, while
# musl needs compiler-rt.a to link libc.so.
# This doens't appear to be a problem for newlib, so only make the change
# for musl.
DEPENDS:remove:class-target:libc-musl = "virtual/${MLPREFIX}libc"
DEPENDS:append:class-target:libc-musl = " musl-initial"

# meta-clang sets these to point to libgcc (the comment says its to avoid a circular
# dependency). However that doesn't help us. Fortunatly it is sufficent (with the change
# to OECMAKE_SOURCEPATH below) to disable standard libs entirely.
UNWINDLIB:class-target:toolchain-clang = "-nostdlib"
COMPILER_RT:class-target:toolchain-clang = "-nostdlib"

# Use compiler-rt as the cmake source path
# This has the effect of building compiler-rt standalone, and avoids a number of top
# level cmake tests which requre a runtime library.
OECMAKE_SOURCEPATH = "${S}/compiler-rt"

# meta-clang has this but commented out
PROVIDES:append:class-target = "\
        virtual/${TARGET_PREFIX}compilerlibs \
        libgcc \
        libgcc-initial \
        libgcc-dev \
        libgcc-initial-dev \
        "

# Adding libatomic to a baremetal build breaks it, as it appears
# __builtin_memcpy() still expands to a call to memcpy(), but the
# code is linked with -nostdlib to avoid needing libc.
# So for now only enable it for musl (i.e. poky) builds.
EXTRA_OECMAKE:append:libc-musl = " -DCOMPILER_RT_BUILD_STANDALONE_LIBATOMIC=ON"

COMPATIBLE_HOST = "${HOST_SYS}"
