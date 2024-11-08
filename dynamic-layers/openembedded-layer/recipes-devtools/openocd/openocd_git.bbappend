SRC_URI:remove = " \
    git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
"

SRC_URI:prepend = " \
    git://${CODASIP_GIT_REPO}/bakewell/cheri-riscv-openocd.git;protocol=ssh;name=openocd;branch=bakewell \
"

SRCREV_openocd = "f7cb786c60abf792bf766be73127a87d35a59ccc"
SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
SRCREV_jimtcl = "1933e5457b9512d39ebbe11ed32578aada149f49"
SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
