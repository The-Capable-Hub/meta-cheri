# Disable LLDB build (even native builds fail currently)
LLDB = ""

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "compiler-rt"

# Don't want to build anything on the target with gcc
BASE_DEFAULT_DEPS:remove:class-target = "virtual/${HOST_PREFIX}gcc"

# Get crtbegin/end from compiler-rt
PACKAGECONFIG:append:pn-compiler-rt = " crt"

# We need to force the use of LLVM lld for Cheri builds
DISTRO_FEATURES:append = " ld-is-lld"

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

# Remove the requirement for python3.
# This needs to be before the recipe is read (and in particular it can't
# be in a .bbappend file), otherwise the
#    inherit ... python3targetconfig
# will be evaluated using the current value of PACKAGECONFIG not the
# final one.
PACKAGECONFIG:remove:pn-libxml2:class-target:cheri = "python"

# libzstd's pointer arithmetics produces unrepresentable addresses
# there's no simple way to fix this
SKIP_RECIPE[zstd] = "libzstd has not been adapted for cheri yet"
