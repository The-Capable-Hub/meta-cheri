FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

QEMU_PATCHES = " \
"

QEMU_PATCHES:qemu-tweaks = " \
 file://axi-net-qemu.patch \
"

# Add this for use on qemu:
EXTRA_PATCHES = " \
 file://axi-net-vcu118-mac-addr.patch \
"

# Add this for use of qemu:
# file://axi-net-qemu.patch
EXTRA_PATCHES:cheri = " \
 file://axi-net-vcu118-mac-addr-cheri.patch \
"

SRC_URI:append = "${EXTRA_PATCHES} ${QEMU_PATCHES}"

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
