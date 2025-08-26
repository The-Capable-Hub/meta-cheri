
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
  file://0001-trace-cmd-fix-container_of-to-work-with-cheri.patch \
"

# libzstd uses weird pointer arithmetic that's not easy to fix for cheri
DEPENDS:remove = "zstd"

# zlib works on cheri, trace-cmd detects zlib automatically
DEPENDS:append = " zlib"

# trace-cmd uses a handwritten makefile
# the recipe's configure task just calls make clean, configuration is done in
# the compile task - we have to set EXTRA_OEMAKE, not EXTRA_OECONF
EXTRA_OEMAKE:append = " NO_LIBZSTD=1"
