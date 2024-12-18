CODASIP_GIT_BRANCH = "hobgoblin"
CODASIP_GIT_BRANCH:cheri = "hobgoblin-cheri"

PV:cheri = "1.5+git${SRCPV}"

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