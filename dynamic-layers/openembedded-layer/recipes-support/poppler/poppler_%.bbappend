# splash requires boost
PACKAGECONFIG:remove = "splash"

FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
    file://Change_type_to_std_basic_string_char16.patch \
"
