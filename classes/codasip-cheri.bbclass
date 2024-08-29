# Disable LLDB build (even native builds fail currently)
LLDB = ""

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "compiler-rt"

# Can't build libcxx at the moment, try without it
BASE_DEFAULT_DEPS:remove = "libcxx"

# Don't want to build anything on the target with gcc
BASE_DEFAULT_DEPS:remove = "virtual/${HOST_PREFIX}gcc"

# Add the musl libssp-nonshared to keep compiler frontend happy
BASE_DEFAULT_DEPS:append = " libssp-nonshared"

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
