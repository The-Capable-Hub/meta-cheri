UBOOT_VERSION = "2024.10"

TOOLCHAIN = "clang"
EXTRA_OEMAKE:remove = 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
# The space after ${CC} on the next line is needed, without it the closing
# " gets lost, resulting in a hard to debug failure.
EXTRA_OEMAKE:append = ' CC="${CC} " LD="${LD}"'

CODASIP_GIT_U_BOOT_HOBGOBLIN_CHERI_BRANCH ?=  "hobgoblin-cheri-v0.9.0"
CODASIP_GIT_U_BOOT_HOBGOBLIN_BRANCH = "${CODASIP_GIT_U_BOOT_HOBGOBLIN_CHERI_BRANCH}"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
