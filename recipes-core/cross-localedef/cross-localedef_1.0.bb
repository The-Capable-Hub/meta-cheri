SUMMARY = "Dummy version of localedef"
LICENSE = "MIT"

S = "${WORKDIR}"

do_populate_sysroot[depends] = ""

do_install () {
        install -d ${D}${bindir_crossscripts}/

	cat >> ${D}${bindir_crossscripts}/localedef << EOF
#!/bin/sh
# Dummy version of localedef
return 1
EOF

	chmod +x ${D}${bindir_crossscripts}/localedef
}

SYSROOT_DIRS += "${bindir_crossscripts}"

INHIBIT_DEFAULT_DEPS = "1"

BBCLASSEXTEND = "native nativesdk"
