CODASIP_GIT_BRANCH = "hobgoblin"
CODASIP_GIT_BRANCH:cheri = "merge"

LINUX_VERSION:cheri ?= "6.10"
KBUILD_DEFCONFIG:cheri = "qemu_riscv64cheripc_defconfig"

# When building Linux 6.10 for cheri, binutils 2.41.0 objcopy fails when
# building the vdso with the error:
#   riscv64-codasip-linux-musl-objcopy: arch/riscv/kernel/vdso/vdso.so.dbg: not enough room for program headers, try linking with -N
#   riscv64-codasip-linux-musl-objcopy: arch/riscv/kernel/vdso/vdso.so.dbg[.hash]: bad value
# This doesn't occur with binutils 2.34 (using in buildroot).
# However also works with llvm-objcopy from LLVM 15.0, so switch to that.
# Same problem occurs building linux 6.5 for non-cheri.
KERNEL_OBJCOPY = "${HOST_PREFIX}llvm-objcopy"

LINUX_VERSION_EXTENSION:append:cheri = "-cheri"
