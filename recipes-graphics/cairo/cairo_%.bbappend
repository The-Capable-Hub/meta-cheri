# Need to disable trace support, otherwise fails to configure with the error:
#   requires dynamic linker and zlib and real pthreads
PACKAGECONFIG:remove = "trace"
