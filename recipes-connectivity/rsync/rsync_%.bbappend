FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files:"

SRC_URI += " \
    file://fix-pointersize.patch \
    file://offset.patch \
"
