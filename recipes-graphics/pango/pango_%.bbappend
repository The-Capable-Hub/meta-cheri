
FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"

SRC_URI += " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-fixes.patch \
"
