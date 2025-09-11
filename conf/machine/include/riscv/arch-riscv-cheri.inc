# RISC-V Architecture with CHERI extension definition

TUNE_CCARGS:append = " ${@ \
  { \
    '' : '', \
    'codasip-lux' : \
      '-march=rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zfhmin_zca_zcb_zcd_zba_zbb_zbkc_zbs -mabi=lp64d', \
    'riscv64cheri' : \
      '-march=rv64imafdc_zcherihybrid_zcherilevels -mabi=l64pc128d', \
    'codasip-lux riscv64cheri' : \
      '-march=rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zfhmin_zca_zcb_zcd_zba_zbb_zbkc_zbs_zcherihybrid_zcherilevels_zish4add -mabi=l64pc128d', \
  }[bb.utils.filter('TUNE_FEATURES', 'codasip-lux riscv64cheri', d)] \
}\
"
