# We don't want a dependency on bash or python as we can't build it yet
RDEPENDS:${PN}:remove = "bash  ${PYTHONRDEPS}"

# which also means we can't have the binaries which depends on it
do_install:append:class-target() {
	grep -lZ "/bin/bash" ${D}${bindir}/* | xargs -0 rm
}
