FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
	file://musl-cheri-timer_t.patch \
	file://cheri_ptrace_arguments_cast.patch \
"

SRC_URI:append:cheri = " \
	file://cheri_uapi.patch \
	file://cheri_tcp_compile_fix.patch \
	file://cheri_iovec_decode_fix.patch \
	file://cheri_print_array.patch \
"
