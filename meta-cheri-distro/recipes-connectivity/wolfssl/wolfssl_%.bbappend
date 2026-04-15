FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://0001-cheri-Use-macro-for-cache-line-masking.patch \
    file://0002-cheri-Fix-CHERI-tag-violation-on-constant-time-point.patch \
    file://0003-cheri-Increase-size-of-argument-buffer-and-align.patch \
    file://0004-cheri-Increase-OpenSSL-compat-holder-sizes-for-MD5-S.patch \
    file://0005-cheri-Use-conditional-copy-over-bitmask-arithmetic-i.patch \
"

EXTRA_OECONF:append = " \
    --enable-all \
    --enable-dtls \
    --enable-dtls13 \
    --enable-dtlscid \
    --enable-dtls-frag-ch \
"

# Declare additional output packages
PACKAGES =+ "${PN}-tests ${PN}-examples"

do_install:append() {
    # ----- Examples (client/server binaries + certs) -----
    install -d ${D}${bindir}
    install -m 0755 ${B}/examples/client/.libs/client ${D}${bindir}/wolfssl-client
    install -m 0755 ${B}/examples/server/.libs/server ${D}${bindir}/wolfssl-server

    install -d ${D}${datadir}/wolfssl
    cp -r ${S}/certs ${D}${datadir}/wolfssl/
    find ${D}${datadir}/wolfssl/certs -name "*.sh"        -delete
    find ${D}${datadir}/wolfssl/certs -name "*.cnf"       -delete
    find ${D}${datadir}/wolfssl/certs -name "*.cfg"       -delete
    find ${D}${datadir}/wolfssl/certs -name "Makefile*"   -delete
    find ${D}${datadir}/wolfssl/certs -name "include.am"  -delete
    find ${D}${datadir}/wolfssl/certs -name "renewcerts*" -delete
    find ${D}${datadir}/wolfssl/certs -name "README*"     -delete

    # ----- Tests (testsuite + unit.test + test configs) -----
    install -m 0755 ${B}/testsuite/.libs/testsuite.test ${D}${bindir}/wolfssl-testsuite
    install -m 0755 ${B}/tests/.libs/unit.test          ${D}${bindir}/wolfssl-unittest

    # Install the input and quit files
    install -m 0644 ${S}/input ${D}${datadir}/wolfssl/input
    install -m 0644 ${S}/quit ${D}${datadir}/wolfssl/quit

    # examples must exist as a directory with non-PEM files
    install -d ${D}${datadir}/wolfssl/examples
    echo "fixture for test_wolfSSL_CTX_load_verify_locations" > ${D}${datadir}/wolfssl/examples/dummy.txt

    # Create the tests folder and move the test configs in
    install -d ${D}${datadir}/wolfssl/tests
    install -m 0644 ${S}/tests/*.conf ${D}${datadir}/wolfssl/tests/
    install -m 0644 ${S}/tests/*.cnf ${D}${datadir}/wolfssl/tests/
    install -m 0644 ${S}/tests/*.txt ${D}${datadir}/wolfssl/tests/
}

# Examples package: client/server binaries and certs
FILES:${PN}-examples = " \
    ${bindir}/wolfssl-client \
    ${bindir}/wolfssl-server \
    ${datadir}/wolfssl/certs \
"

# Tests package: test binaries and test configs
# Depends on examples package because testsuite uses certs/
FILES:${PN}-tests = " \
    ${bindir}/wolfssl-testsuite \
    ${bindir}/wolfssl-unittest \
    ${datadir}/wolfssl/tests \
    ${datadir}/wolfssl/input \
    ${datadir}/wolfssl/quit \
    ${datadir}/wolfssl/examples \
"
RDEPENDS:${PN}-tests = "${PN}-examples"

# Suppress harmless QA warnings on the test binaries
INSANE_SKIP:${PN}-tests += "buildpaths"