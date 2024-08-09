SUMMARY = "Dummy qemu as we don't support user mode CHERI emulation yet"
LICENSE = "BSD-3-Clause & BSD-2-Clause"
SECTION = "devel"

BBCLASSEXTEND = "native nativesdk"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

INHIBIT_DEFAULT_DEPS = "1"

S = "${WORKDIR}"

do_install() {
	cat > dummy-qemu <<-EOF
		#!/bin/sh
		echo "Dummy version of qemu to keep Yocto happy"
		exit 1
		EOF
	for target in ${QEMU_TARGETS} ; do
	    install -Dm 0644 dummy-qemu ${D}${bindir}/qemu-$target
	done
}
