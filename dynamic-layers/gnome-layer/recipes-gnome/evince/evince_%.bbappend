FILESEXTRAPATHS:prepend :=  "${FILE_DIRNAME}/files/:"
SRC_URI:append:class-target = " \
    file://cheri-fixes.patch \
"
DEPENDS:remove = " \
    gnome-desktop \
    gspell \
    libsecret \
    gstreamer1.0-plugins-base \
"
REQUIRED_DISTRO_FEATURES:remove = "opengl"
