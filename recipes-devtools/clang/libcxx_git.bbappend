COMPATIBLE_HOST = "${HOST_SYS}"

# meta-clang libcxx puts unwind-shared into PACKAGECONFIG, but we do not want it for baremetal
PACKAGECONFIG:remove:pn-libcxx = "unwind-shared"

# Cheri __libuwind_config.h breaks on cross-unwinding _LIBUNWIND_CAPREG_START undefined but needed for mips TODO: Fix this
EXTRA_OECMAKE:remove = "-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON"

# meta-clang libcxx is putting gcc libraries into CXXFLAGS and LDFLAGS
# That seems strange and will not work if the gcc libraries are not built
# so remove them
CXXFLAGS:remove = "-stdlib=libstdc++"
LDFLAGS:remove = "-unwindlib=libgcc -stdlib=libstdc++"

LDFLAGS:append = " -nostdlib"

# libcxx code assumes existence of posix_memalign, which is supported by newlib but only when a feature is defined
# For a linux target build, we would have _GNU_SOURCE defined, and that enables it, so define that for baremetal too
# CXXFLAGS:append = " -D_GNU_SOURCE"

## SIM: Hack to keep build happy
RPROVIDES:${PN} += " libstdc++-dev libstdc++ libatomic-dev libatomic"