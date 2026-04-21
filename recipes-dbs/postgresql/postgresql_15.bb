require postgresql.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/cheri-patches:"

LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=75af6e3eeec4a06cdd2e578673236fc3"

SRCBRANCH = "15_beta4-cheri"

SRC_URI += "\
   file://0001-not-check-perl-under-cross-compiling.patch \
   file://0003-configure.ac-bypass-autoconf-2.69-version-check.patch \
   file://0004-config_info.c-not-expose-build-info.patch \
   file://0005-Improve-reproducibility.patch \
   file://0006-postgresql-fix-ptest-failure-of-sysviews.patch \
   file://0007-parser-remove-line-directive.patch \
"

# cheri-patches
SRC_URI += "\
   file://0001-port.h-change-qsort_s-to-qsort_r.patch \
   file://0002-qsort-change-defines-from-freebsd-to-cheri.patch \
   file://0003-array-fix-parameters.patch \
   file://0004-xml-fix-function-header.patch \
   file://0005-ps_status-disable-clobber.patch \
   file://0006-parallel_schedule-remove-indirect_toast.patch \
"

SRC_URI[sha256sum] = "de8485f4ce9c32e3ddfeef0b7c261eed1cecb54c9bcd170e437ff454cb292b42"

CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to out configuration of postgresql so we can safely ignore it."
