DEPENDS:remove:class-target = "bash-completion"
RDEPENDS:${PN}-ptest:remove = "make bash"
RDEPENDS:${PN}-bash-completion:remove = "bash-completion"
do_install:append() {
  rm -rf ${D}${datadir}/bash-completion
}
