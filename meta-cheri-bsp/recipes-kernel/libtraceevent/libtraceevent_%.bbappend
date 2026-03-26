FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
  file://0001-libtraceevent-fix-binary-search-for-function-name.patch \
  file://0002-libtraceevent-fix-a-cast-for-cheri.patch \
"
