FILESEXTRAPATHS:prepend := "${THISDIR}/gtk+3:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
    file://selection_item_size.patch \
"
