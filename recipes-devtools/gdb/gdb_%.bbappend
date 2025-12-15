PACKAGECONFIG:remove = "python"
DEPENDS:remove = "lttng-ust"
DEPENDS:append = " mpfr"
TOOLCHAIN = "clang"

require gdb-cheri-common.inc
