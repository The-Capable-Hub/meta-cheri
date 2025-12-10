# The body of this came from CHERI BSD:
# https://github.com/CTSRD-CHERI/cheribsd-ports/blob/main/Mk/bsd.port.mk

do_fixup_gnulib() {
    # Work around gnulib insisting on providing its own stdint.h which (among
    # other things) redefines (u)intptr_t to (unsigned) long with a hard to
    # debug mix of typedefs and #defines.  As this is mostly pointless, replace
    # with an include of the system header until upstream finds a better solution.
    for f in `find ${S} -type f -name stdint.in.h` ; do
	if grep -q "typedef long int gl_intptr_t" ${f} ; then
	    if ! grep -q "__INTPTR_WIDTH__ != (defined _WIN64 ? LLONG_WIDTH : LONG_WIDTH)" ${f} ; then
		echo "Updating ${f}"
		cp ${f} ${f}.bak
		cp "${CODASIP_CHERI_FILES_DIR}/stdint.in.h" ${f}
		if grep -q "@GNULIB_OVERRIDES_WINT_T@" ${f}.bak ; then
		    sed -i -e 's|@GNULIBHEADERS_OVERRIDE_WINT_T@|@GNULIB_OVERRIDES_WINT_T@|g' ${f}
		fi
	    fi
	fi
    done

	for SRC_GNULIB_PATH in "${CODASIP_CHERI_FILES_DIR}"/gnulib/*; do
		SRC_GNULIB_FILE="$(basename "${SRC_GNULIB_PATH}")"
		for DEST_GNULIB_PATH in $(find "${S}" -type f -name "${SRC_GNULIB_FILE}"); do
			echo "Replacing ${DEST_GNULIB_PATH} with ${SRC_GNULIB_PATH}"
			cp "${SRC_GNULIB_PATH}" "${DEST_GNULIB_PATH}"
		done
	done

    # Fixup versions of malloca.c which have been updated for CHERI, but lack
    # a cast required by current versions of llvm.
    for f in $(find "${S}" -type f -name malloca.c) ; do
	echo "Ensure that $f CHERI support works with llvm"
	mv $f ${f}.bak
	sed 's/void \*mem = sp\[-1\]/void *mem = (void *) sp[-1];/' ${f}.bak > $f
    done
}

addtask fixup_gnulib after do_patch before do_configure
