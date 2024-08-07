python () {
  import re
  cc=d.getVar("CC")
  def extract_arg(arg):
    return re.search(r'%s=(\w*)' % arg, cc).group(1)
  d.setVar("RISCV_VARS", "PLATFORM_RISCV_ABI=%s PLATFORM_RISCV_ISA=%s" %
    (extract_arg("-mabi"), extract_arg("-march")))
}

EXTRA_OEMAKE:append:cheri = " ${RISCV_VARS}"