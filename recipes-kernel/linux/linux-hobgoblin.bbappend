FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

CODASIP_GIT_LINUX_HOBGOBLIN_CHERI_BRANCH ?= "bakewell-morello"
CODASIP_GIT_LINUX_HOBGOBLIN_BRANCH = "${CODASIP_GIT_LINUX_HOBGOBLIN_CHERI_BRANCH}"

LINUX_VERSION = "6.16.0"

KBUILD_DEFCONFIG = "codasip-a730-hobgoblin2_defconfig"
KBUILD_DEFCONFIG:cheri = "codasip-x730-hobgoblin2_defconfig"
KBUILD_DEFCONFIG:codasip-prime = "codasip-a730-prime_defconfig"
KBUILD_DEFCONFIG:codasip-prime:cheri = "codasip-x730-prime_defconfig"

# When building Linux 6.10 for cheri, binutils 2.41.0 objcopy fails when
# building the vdso with the error:
#   riscv64-codasip-linux-musl-objcopy: arch/riscv/kernel/vdso/vdso.so.dbg: not enough room for program headers, try linking with -N
#   riscv64-codasip-linux-musl-objcopy: arch/riscv/kernel/vdso/vdso.so.dbg[.hash]: bad value
# This doesn't occur with binutils 2.34 (using in buildroot).
# However also works with llvm-objcopy from LLVM 15.0, so switch to that.
# Same problem occurs building linux 6.5 for non-cheri.
KERNEL_OBJCOPY = "${HOST_PREFIX}llvm-objcopy"

# We can't use binutils to strip kernel object files since it is not
# aware of CHERI specific relocations. Use llvm-strip instead.
KERNEL_STRIP = "${HOST_PREFIX}llvm-strip"

LINUX_VERSION_EXTENSION:append:cheri = "-cheri"
