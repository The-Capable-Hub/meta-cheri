UBOOT_VERSION = "2024.1"

TOOLCHAIN = "clang"
EXTRA_OEMAKE:remove = 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
# The space after ${CC} on the next line is needed, without it the closing
# " gets lost, resulting in a hard to debug failure.
EXTRA_OEMAKE:append = ' CC="${CC} " LD="${LD}"'
