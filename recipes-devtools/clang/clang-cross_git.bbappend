require common-cheri.inc

DEPENDS:remove = "virtual/${TARGET_PREFIX}binutils"

# There are too many places where Yocto assumes ${TARGET_PREFIX}<tool>
# works, so install extra, non llvm- symlinks.
do_install:append () {
    install -d ${D}${bindir}
    for tool in nm ar as ranlib strip objcopy objdump readelf \
	addr2line dwp size strings cov
    do
	ln -sf ../llvm-$tool ${D}${bindir}/${TARGET_PREFIX}$tool
    done
}

# Similarly, there are too many dependencies on binutils/gcc which really
# just mean toolchain or compiler.
PROVIDES:append = " \
    virtual/${TARGET_PREFIX}binutils \
    virtual/${TARGET_PREFIX}gcc \
"
