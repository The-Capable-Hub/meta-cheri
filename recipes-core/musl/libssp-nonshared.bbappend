# Remove hardwired gcc dependency
DEPENDS:remove = " virtual/${TARGET_PREFIX}gcc"
DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH}"

# Allow building into nativesdk
BBCLASSEXTEND = "nativesdk"
COMPATIBLE_HOST = "."
