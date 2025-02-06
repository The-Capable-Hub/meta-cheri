
FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"

SRC_URI:append:class-target = " \
    file://cheribsd.patch;striplevel=0 \
    file://cheri-fixes.patch \
"
