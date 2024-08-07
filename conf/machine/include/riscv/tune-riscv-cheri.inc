require arch-riscv-cheri.inc

TUNEVALID[riscv64cheri] = "Enable 64-bit RISC-V with CHERI extension"

AVAILTUNES += "riscv64cheri"

TUNE_FEATURES:tune-riscv64cheri = "${TUNE_FEATURES:tune-riscv64} riscv64cheri"
TUNE_ARCH:tune-riscv64cheri = "riscv64"
TUNE_PKGARCH:tune-riscv64cheri = "riscv64cheri"
PACKAGE_EXTRA_ARCHS:tune-riscv64cheri = "riscv64cheri"
