#!/bin/bash

ltp="/opt/ltp"
logs="/home/root/ltp"
tstamp=$(date +"%Y-%m-%dT%H%M%S")

# set default timeout multiplier to 10 if not defined by caller
: "${LTP_TIMEOUT_MUL:=10}"

# skip lists
skipl="musl,qemu,riscv"

run_ltp_suite_tests() {
    : "${suite:?}"

    LTP_TIMEOUT_MUL="${LTP_TIMEOUT_MUL}" \
    "${ltp}"/runltp \
        -p \
        -f "${suite}" \
        -l "${logs}/ltp-${suite}_${tstamp}.log" \
        -C "${logs}/ltp-${suite}_${tstamp}.failed" \
        -S <( eval "cat ${ltp}/runtest/${suite}_codasip_{$skipl}_skip" )
}

suite="syscalls" run_ltp_suite_tests
