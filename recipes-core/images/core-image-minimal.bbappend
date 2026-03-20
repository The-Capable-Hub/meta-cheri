IMAGE_ROOTFS_EXTRA_SPACE = "4194304"

IMAGE_INSTALL:append = "\
                        coreutils \
                        gdb \
                        postgresql \
                        postgresql-dbg \
                        postgresql-contrib \
                        postgresql-client \
                        postgresql-server-dev \
                        postgresql-test \
                        musl-dbg \
                        procps \
                        strace \
                        sysstat \
                        file \
                        "
