#!/bin/sh

DIR="${1:-build}"
MACHINE="qemuriscv64cheri"
CONFFILE="conf/auto.conf"
BITBAKEIMAGE="core-image-minimal"

# bootstrap OE
echo "Init OE"
export BASH_SOURCE="poky/oe-init-build-env"
. ./poky/oe-init-build-env $DIR

# add the missing layers
echo "Adding layers"
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-clang
bitbake-layers add-layer ../meta-cheri

# fix the configuration
if [ -e $CONFFILE ]; then
    echo "$CONFFILE already exists, and will not be modified."
else
    echo "Creating auto.conf"
    cat <<-EOF > $CONFFILE
	MACHINE ?= "${MACHINE}"
	DISTRO_FEATURES += "cheri"
	USER_CLASSES:append = " buildstats buildhistory buildstats-summary"
	EOF
fi

echo "To build an image run"
echo "---------------------------------------------------"
echo "bitbake core-image-minimal"
echo "---------------------------------------------------"
echo ""
echo "Buildable machine info"
echo "---------------------------------------------------"
echo "* qemuriscv64cheri: QEMU 64-bit RISC-V CHERI machine"
echo "---------------------------------------------------"
