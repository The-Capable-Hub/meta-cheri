FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"
SRC_URI:append = " \
    file://cheri-fixes.patch \
"
