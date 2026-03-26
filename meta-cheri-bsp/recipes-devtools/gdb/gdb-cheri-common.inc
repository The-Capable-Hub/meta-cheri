PV = "14.1+git"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
SRC_URI = " \
    git://${META_CHERI_GDB_REPO};protocol=${META_CHERI_GDB_PROTOCOL};branch=${META_CHERI_GDB_BRANCH} \
"

# Remove patch added by meta-clang. Only needed when building with glibc.
SRC_URI:remove = " \
    file://0001-gdb-Link-with-latomic-for-riscv-clang-alone.patch \
"
