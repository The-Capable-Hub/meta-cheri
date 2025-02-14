FILESEXTRAPATHS:prepend := "${THISDIR}/libxt:"
SRC_URI:append:class-target = " \
	file://alloc_align.patch \
"
