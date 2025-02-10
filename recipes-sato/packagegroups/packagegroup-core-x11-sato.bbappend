# This pulls in pppd and other packages that haven't been adapted for cheri.
RDEPENDS:${PN}-base:remove = "connman-gnome"

# TODO: Why can't we remove these by updating
# DISTRO_FEATURES in core-image-sato.bbappend?
RDEPENDS:${PN}-base:remove = \
   "pulseaudio-server pulseaudio-client-conf-sato pulseaudio-misc"

# This pulls in rust (via adwaita and librsvg).
RDEPENDS:${PN}-apps:remove = "pcmanfm"

PREFERRED_VERSION_librsvg = "2.40.21"
