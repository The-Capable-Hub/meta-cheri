# Need to disable trace support, otherwise fails to configure with the error:
#   requires dynamic linker and zlib and real pthreads
PACKAGECONFIG:remove = "trace"

FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"

SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
    file://0001-aclocal.cairo.m4-ignore-linker-output.patch \
    file://cheri-fixes.patch \
"
