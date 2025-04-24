SRC_URI:remove = " \
    git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
    git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
"

CODASIP_GIT_OPENOCD_CHERI_BRANCH ?= "bakewell"
SRC_URI:prepend = " \
    git://${CODASIP_GIT_REPO}/bakewell/cheri-riscv-openocd.git;protocol=ssh;name=openocd;branch=${CODASIP_GIT_OPENOCD_CHERI_BRANCH} \
"

SRCREV_openocd = "999e2242bdf272f0a5dcef9a766fc75358c05448"
SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"

EXTRA_OECONF += " --enable-internal-jimtcl"
