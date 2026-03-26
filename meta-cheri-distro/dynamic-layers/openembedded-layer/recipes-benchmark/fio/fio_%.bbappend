FILESEXTRAPATHS:prepend := "${THISDIR}/fio:"
SRC_URI += " \
	file://io_uring-Cherify-io_uring-wrappers.patch \
	file://cheri-arch-Use-syscall-.-instead-of-RV64I-wrappers-f.patch \
	file://oslib-Fix-missing-macro-for-non-GNU-C-libraries.patch \
	"

# bump to v3.41
SRCREV = "ed675d3477a70a42d2e757b713f6c7125a27cdca"

RDEPENDS:${PN}:remove = "python3-core"

# Numactl is not building currently
PACKAGECONFIG_NUMA:riscv64 = ""
PACKAGECONFIG_NUMA:riscv32 = ""

# Fio uses shared memory to pass information from the main job to the
# children executing the benchmark. This shared data includes pointers, which
# is generally unsafe and fragile. PureCap CHERI even enforces that
# capabilities stored and loaded from shared memory are invalid, as a
# capability in a different process context may grant unpermitted access.
# Thus, do not use shared memory on CHERI.
EXTRA_OECONF:cheri:append = " --disable-shm"
