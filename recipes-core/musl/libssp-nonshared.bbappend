# Remove hardwired gcc dependency
DEPENDS:remove = " virtual/${TARGET_PREFIX}gcc"
DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH}"

# Note there is also a
# TOOLCHAIN:pn-libssp-nonshared = "gcc"
# in nonclangable.conf which we remove in codasip-cheri.bbclass

# Allowbuilding into nativesdk
BBCLASSEXTEND = "nativesdk"
COMPATIBLE_HOST = "."
