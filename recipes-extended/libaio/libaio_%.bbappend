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
    "
