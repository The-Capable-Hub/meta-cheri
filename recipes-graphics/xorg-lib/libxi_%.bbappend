
FILESEXTRAPATHS:prepend := "${THISDIR}/libxi/:"

SRC_URI:append = " \
  file://cheribsd.patch;striplevel=0 \
"
