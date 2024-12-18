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

QEMU_TARGETS:remove:cheri = "x86_64"

PACKAGECONFIG:remove:cheri = "alsa"

# do_install[depends] += "hobgoblin-bootfiles:do_deploy"

do_install:append() {
    # install -Dm 0644 ${DEPLOY_DIR_IMAGE}/fsbl_rom.xexe ${D}${datadir}/qemu

    # Install qmp python package to be used with testimage
    install -D ${S}/python/qemu/qmp/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/__init__.py
    install -D ${S}/python/qemu/qmp/qemu_ga_client.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/qemu_ga_client.py
    install -D ${S}/python/qemu/qmp/qmp_shell.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/qmp_shell.py
    install -D ${S}/python/qemu/qmp/qom.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/qom.py
    install -D ${S}/python/qemu/qmp/qom_common.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/qom_common.py
    install -D ${S}/python/qemu/qmp/qom_fuse.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/qom_fuse.py
    install -D ${S}/python/qemu/qmp/py.typed ${D}${PYTHON_SITEPACKAGES_DIR}/qmp/py.typed
}

# EXTRA_OEMAKE:append = " V=1"
