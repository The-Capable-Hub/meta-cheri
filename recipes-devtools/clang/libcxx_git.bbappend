COMPATIBLE_HOST = "${HOST_SYS}"

# Enabling cross-platform unwinding support causes us to try and build the CHERI MIPS
# unwind support, which fails for RISC-V.
EXTRA_OECMAKE:remove = "-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON"

# Normally meta-clang builds of libc++ find libstdc++ when CMake performs its compiler checks,
# but that doesn't help us. Fortunatly the test program only needs to link, and doesn't need
# anything from the C++ library, so we can get away wth just disabling it.
LDFLAGS:append = " -nostdlib++"

## SIM: Hack to keep build happy
RPROVIDES:${PN} += " libstdc++-dev libstdc++ libatomic-dev libatomic"