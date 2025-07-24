FILESEXTRAPATHS:prepend := "${THISDIR}/libaio:"
SRC_URI += " \
    file://0001-syscall-Replace-argument-casts-with-uintptr_t.patch \
    file://0002-aio_abi-Fit-io_event-struct-to-kernel-definition.patch \
    "
