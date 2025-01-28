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

    # Patch rawmemchr not to use uintptr_t to store arbitrary bytes.
    for f in `find ${S} -type f -name rawmemchr.c` ; do
	if grep -q "typedef uintptr_t longword" ${f} ; then
	    echo "Replacing ${f}"
	    if grep -q "verify (UINTPTR_WIDTH " ${f} ; then
		patch -s ${f} ${CODASIP_CHERI_FILES_DIR}/extrapatch-cheribsd-rawmemchr-v1.patch
	    else
		patch -s ${f} ${CODASIP_CHERI_FILES_DIR}/extrapatch-cheribsd-rawmemchr-v2.patch
	    fi
	fi
    done
}

addtask fixup_gnulib after do_patch before do_configure
