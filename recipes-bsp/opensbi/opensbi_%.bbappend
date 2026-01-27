ERROR_QA:remove = "version-going-backwards"
SRCREV = "${AUTOREV}"

CODASIP_GIT_OPENSBI_CHERI_BRANCH ?= "v1.7-cheri"
CODASIP_GIT_OPENSBI_BRANCH ?= "${CODASIP_GIT_OPENSBI_CHERI_BRANCH}"

SRC_URI = " \
    git://${CODASIP_GIT_CHERILINUX_REPO}/opensbi;protocol=${CODASIP_GIT_PROTOCOL};branch=${CODASIP_GIT_OPENSBI_BRANCH} \
"

PV = "1.7+git${SRCPV}"

python () {
  import re
  cc=d.getVar("CC")
  def translate_arg(cc_arg, new_var):
    r = re.search(r'%s=(\w*)' % cc_arg, cc)
    if r :
      return new_var + "=" + r.group(1)
    return ""
  d.setVar("RISCV_VARS", translate_arg("-mabi", "PLATFORM_RISCV_ABI") + " " + translate_arg("-march", "PLATFORM_RISCV_ISA"))
}

EXTRA_OEMAKE:append = " ${RISCV_VARS}"
# TODO: Remove explicitly `CC_SUPPORT_VECTOR=n` when CHERI compiler supports 
#       vector externsion for CHERI
EXTRA_OEMAKE:append:cheri = " CC_SUPPORT_VECTOR=n"
