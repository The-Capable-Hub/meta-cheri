# This pulls in pppd and other packages that haven't been adapted for cheri.
RDEPENDS:${PN}-base:remove = "connman-gnome"

# This pulls in rust (via adwaita and librsvg).
RDEPENDS:${PN}-apps:remove = "pcmanfm"

