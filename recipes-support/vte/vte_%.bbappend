# gnutls hasn't yet been adapted for cheri
PACKAGECONFIG:remove = "gnutls"
EXTRA_OEMESON:append = " -D_b_symbolic_functions=false"
