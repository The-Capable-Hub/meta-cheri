do_install:append() {
    rm ${D}${bindir}/lsusb.py
}
RDEPENDS:${PN}-python:remove = "python3-core"
