# RISC-V Architecture with CHERI extension definition

DEFAULTTUNE:cheri = "riscv64cheri"

TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64cheri', '-march=rv64imafdc_zcherihybrid_zcherilevels -mabi=l64pc128d', ' ', d)}"
