# Update to pseudo 1.9.3
SRC_URI:remove = " \
    file://0001-configure-Prune-PIE-flags.patch \
    file://older-glibc-symbols.patch \
"
SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
PV = "1.9.3+git"
