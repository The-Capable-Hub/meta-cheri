LICENSE = "Apache-2.0 & MIT"
LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=81c2607dc435e1c1bd6ad7238e69f2d9 \
                    file://LICENSE-APACHE;md5=5e2b0f0f8c14f0e876b84594379dbc59"
SRC_URI = "git://github.com/capablevms/cheri-examples.git;protocol=https;branch=master \
           file://0001-build-Allow-configurability-of-compiler-and-compiled.patch \
           file://0002-examples-Fix-examples-to-build-with-our-libc.patch \
           "

# We fix the latest commit here. The repo does not have any release, so we start
# with version 0.1.
SRCREV = "1b8e34f2f3290ea01fe09b58769816c53c61b8d2"
PV = "0.1+git"
PR = "r0"

S = "${WORKDIR}/git"

SUPPORTED_EX =  "allocate.c bounds.c check_length.c check_mask.c function.c \
                 general_bounds.c set_bounds.c setjmp.c stackscan.c xor_pointers.c"

# 'stackscan' requires to turn optimizations off as it prints a callstack of
# functions that would get inlined otherwise
SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION",True).replace("-O2", "-O0")}"
do_compile () {
	oe_runmake -f Makefile.riscv64-purecap CFILES="${SUPPORTED_EX}"
}

do_install () {
    out="${D}/opt/cheri-examples"
    mkdir -p "${out}/src"

    # install binaries
    cp -r  "${S}/bin/riscv64-purecap/" "${out}/bin"
    chmod -R 755 "${out}/bin"

    # install source files
    for s in ${SUPPORTED_EX}; do
        cp "${S}/${s}" "${out}/src/"
    done
}

FILES:${PN} += "/opt/cheri-examples"
