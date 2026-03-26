do_compile:prepend() {
    # Some of clang's header files check for existance of a 'system' provided
    # header file:
    #   /* If we're hosted, fall back to the system's stdint.h, which might have
    #    * additional definitions.
    #    */
    #   #if __STDC_HOSTED__ && __has_include_next(<stdint.h>)
    # However, U-Boot provides dummy versions of these files which do
    # nothing, but because of this check get used in preference.
    # So delete them.
    rm -f ${S}/include/stdint.h
    rm -f ${S}/include/stdlib.h
}
