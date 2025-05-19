FILESEXTRAPATHS:prepend := "${THISDIR}/bash:"
SRC_URI += " \
	file://cheri-Fix-CHERI-faults.patch \
	file://adjust-members-of-COMMAND-and-SIMPLE_COM.patch \
"
