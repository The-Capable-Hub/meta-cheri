DESCRIPTION = "The RISC-V Proxy Kernel, `pk`, is a lightweight application execution environment that can host statically-linked RISC-V ELF binaries."
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=80a1dc6f26248c4bf4c61c5de5330918 \
		    file://LICENSE.Batten;md5=95199699b921e77d38b31e0d3a6526bc"

require recipes-bsp/opensbi/opensbi-payloads.inc

inherit autotools deploy

EXTRA_AUTORECONF += " --exclude=aclocal"

SRC_URI = " \
    git://${CODASIP_GIT_REPO}/cheririscv-pk.git;protocol=${CODASIP_GIT_PROTOCOL};branch=cheri-bakewell \
"

S = "${WORKDIR}/git"

SRCREV = "${AUTOREV}"
PV = "6.10+git${SRCPV}"

# Required if specifying a custom payload
#do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"

# If RISCV_SBI_PAYLOAD is set then include it as a payload
#EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
#EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"

# If we don't specify the arch and abi the defaults are
# -march=rv64im_zicsr_zifencei -mabi=lp64
EXTRA_OECONF += " \
    --enable-logo \
    --with-mem-start=0x80000000 \
    --enable-zero-bss \
    --with-arch=rv64imafdc_zcherihybrid \
    --with-abi=l64pc128 \
    --with-payload=no \
"
EXTRA_OEMAKE += " bbl"

autotools_do_install() {
  :
}

do_deploy () {
    install -m 755 ${B}/bbl ${DEPLOYDIR}/
}

addtask deploy before do_build after do_install

COMPATIBLE_HOST = "(riscv64|riscv32).*"
