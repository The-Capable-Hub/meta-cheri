inherit ptest

FILESEXTRAPATHS:prepend := "${THISDIR}/libaio:"
SRC_URI += " \
    file://0001-syscall-Replace-argument-casts-with-uintptr_t.patch \
    file://0002-aio_abi-Fit-io_event-struct-to-kernel-definition.patch \
    file://0001-tests-8.t-Replace-pwrite64-with-pwrite.patch \
    file://0002-tests-22.t-Fix-poll-header-inclusion.patch \
    file://0003-tests-19.t-Unify-io_event-ring-buffer-layout.patch \
    file://0004-tests-19.t-Add-rw-permissions-to-new-remap-cap.patch \
    file://0005-tests-Makefile-Refactor-testing-targets.patch \
    file://0006-tests-Fix-build-error-if-compiler-is-clang.patch \
    file://run-ptest \
    "

# To enable ptests for libaio:
# * you can set 'PTEST_ENABLED:pn-libaio= "1"' your local.conf,
# * add the package 'libaio-ptest' to your image,
# * extend the disk space to 2G by adding 'IMAGE_ROOTFS_SIZE=2097152'
#   (some tests write a lot to disk)
#
# To run the tests, execute on the target: 'ptest-runner -t$((3*60*60)) libaio'
# ('-t' allows to provide an extended timeout)

PTESTS_SLOW:append = " libaio"

RDEPENDS:${PN}-ptest += "make"
RDEPENDS:${PN}-ptest += "bash"

do_compile_ptest() {
    oe_runmake -C harness
}

do_install_ptest() {
    cp  "${S}/Makefile" "${D}${PTEST_PATH}/"
    cp -r "${S}/harness" "${D}${PTEST_PATH}/"
}
