DESCRIPTION = "Cheri Linux Kernel"
SECTION = "kernel"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

inherit kernel
inherit kernel-yocto
inherit kernel-clang

KCONF_AUDIT_LEVEL ?= "2"
CONF_BSP_AUDIT_LEVEL ?= "3"
KMETA_AUDIT ?= "yes"

KERNEL_VERSION_SANITY_SKIP = "1"

SRCREV = "${AUTOREV}"
PV = "${LINUX_VERSION}+git${SRCPV}"
ERROR_QA:remove = "version-going-backwards"

CODASIP_GIT_LINUX_HOBGOBLIN_BRANCH ?= "bakewell-morello"
SRC_URI = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/linux.git;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_LINUX_HOBGOBLIN_BRANCH} \
"

LINUX_VERSION ?= "6.18.0"
LINUX_VERSION_EXTENSION:append = "-cheri"

KCONFIG_MODE="--alldefconfig"

KBUILD_DEFCONFIG ?= "qemu_riscv64cheripc_defconfig"

COMPATIBLE_MACHINE = "^qemu.*cheri$"

# Keep kernel_configcheck task happy when it calls symbol_why.py
CLANG_FLAGS:toolchain-clang = "-fintegrated-as"
export CLANG_FLAGS

do_install:append() {
	if ! (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
	fi
}

KERNEL_FEATURES:remove = "features/debug/printk.scc"
KERNEL_FEATURES:remove = "features/kernel-sample/kernel-sample.scc"
KERNEL_FEATURES:remove = "features/taskstats/taskstats.scc"
KERNEL_FEATURES:remove = "cfg/fs/vfat.scc"
