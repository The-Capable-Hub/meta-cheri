# Need to disable trace support, otherwise fails to configure with the error:
#   requires dynamic linker and zlib and real pthreads
PACKAGECONFIG:remove = "trace"

FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"

SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-fixes.patch \
    file://scan_converter.patch \
"
