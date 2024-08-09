BPN = "qemu"

inherit python3-dir

require qemu-native.inc

DEPENDS = "glib-2.0-native zlib-native pixman-native bison-native meson-native ninja-native"

EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"

PACKAGECONFIG ??= "fdt alsa kvm pie \
    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
"

# Handle distros such as CentOS 5 32-bit that do not have kvm support
PACKAGECONFIG:remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"

do_install[depends] += "hobgoblin-bootfiles:do_deploy"

do_install:append() {
    install -Dm 0644 ${DEPLOY_DIR_IMAGE}/fsbl_rom.xexe ${D}${datadir}/qemu

    # Install qmp.py to be used with testimage
    install -D ${S}/python/qemu/qmp.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.py
}

# EXTRA_OEMAKE:append = " V=1"
