# Disable LLDB build (even native builds fail currently)
LLDB = ""

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "compiler-rt"

# Don't want to build anything on the target with gcc
BASE_DEFAULT_DEPS:class-target:remove = "virtual/${HOST_PREFIX}gcc"

# Get crtbegin/end from compiler-rt
PACKAGECONFIG:append:pn-compiler-rt = " crt"

# We need to force the use of LLVM lld for Cheri builds
DISTRO_FEATURES:append = " ld-is-lld"

SYSVINIT_SCRIPTS:remove = "modutils-initscripts"
VIRTUAL-RUNTIME_initscripts = ""
VIRTUAL-RUNTIME_base-utils = ""
VIRTUAL-RUNTIME_login_manager = ""
VIRTUAL-RUNTIME_init_manager = "busybox"
VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
VIRTUAL-RUNTIME_base-utils-syslog = ""

# Override the toolchain specified in nonclangable.
TOOLCHAIN:pn-libssp-nonshared = "clang"

TC_CXX_RUNTIME="llvm"

# Not only is this unnecessary for cheri, it generates a warning
# telling you this, which causes problems with some configure scripts.
SECURITY_STACK_PROTECTOR = ""

# Remove gcc runtime-libraries from the SDK
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libgcc"
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libgcc-dev"
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libatomic"
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libatomic-dev"
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libstdc++"
RDEPENDS:packagegroup-core-standalone-sdk-target:remove = "libstdc++-dev"
