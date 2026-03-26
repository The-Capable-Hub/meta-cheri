inherit cheri-gnulib-fixes

# libidn (Internationalized Domain Names) hasn't yet been adapted for cheri
PACKAGECONFIG:remove = "libidn"
