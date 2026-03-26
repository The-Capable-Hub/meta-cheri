# This pulls in pppd and other packages that haven't been adapted for cheri.
RDEPENDS:${PN}-base:remove = "connman-gnome"

# This pulls in rust (via adwaita and librsvg).
RDEPENDS:${PN}-apps:remove = "pcmanfm"

# This pulls in python (via vte, vala and gobject-introspection)
RDEPENDS:${PN}-apps:remove = "matchbox-terminal"
