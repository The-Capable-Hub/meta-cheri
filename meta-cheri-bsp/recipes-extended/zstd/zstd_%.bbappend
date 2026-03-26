FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
   file://0001-cheri-fix-cast-that-creates-an-invalid-pointer.patch \
   file://0002-Don-t-cast-a-pointer-to-size_t.patch \
"
