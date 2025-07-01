#!/bin/bash

ltp="/opt/ltp"
logs="/home/root/ltp"
tstamp=$(date +"%Y-%m-%dT%H%M%S")

# set default timeout multiplier to 10 if not defined by caller
: "${LTP_TIMEOUT_MUL:=10}"

# skip lists
skipl="musl,qemu,riscv,incompatible"

# by default, test files are created in /tmp. Some tests require a non-tempfs
# filesystem for their test files though. Move it to block dev mounted at "/".
test_files_dir="/ltptmp"

run_ltp_suite_tests() {

    if [[ ! -d "/lib/modules/$(uname -r)" ]]; then
        >&2 echo "ERROR: Module information not present in /lib/modules/$(uname -r)"
        return 1
    fi

    : "${suite:?}"
    test_tmp="${test_files_dir}_${suite}"
    [[ -d "${test_tmp}" ]] && rm -rf "${test_tmp}"

    # Some tests run as "nobody"
    mkdir -m777 "${test_tmp}"

    LTP_TIMEOUT_MUL="${LTP_TIMEOUT_MUL}" \
    "${ltp}"/runltp \
        -p \
        -f "${suite}" \
        -d "${test_tmp}" \
        -l "${logs}/ltp-${suite}_${tstamp}.log" \
        -C "${logs}/ltp-${suite}_${tstamp}.failed" \
        -S <( eval "cat ${ltp}/runtest/${suite}_codasip_{$skipl}_skip" )

    # cleanup
    rm -rf "${test_tmp}"
}

: "${suite:="syscalls"}"
suite="${suite}" run_ltp_suite_tests
