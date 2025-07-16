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

syscall_suite_checks() {
    local ret=0
    if [[ ! -d "/lib/modules/$(uname -r)" ]]; then
        >&2 echo "ERROR: Module information not present in /lib/modules/$(uname -r)"
        ret=1
    fi

    if (( $(nproc) < 2 )); then
        >&2 echo "ERROR: Some syscall tests require SMP"
        ret=1
    fi

    if [[ ! -d "/dev/shm" ]]; then
        >&2 echo "ERROR: Some syscall tests require /dev/shm"
        ret=1
    fi

    return ${ret}
}

check_suite_prerequisites() {
    if [[ $1 == "syscalls" ]]; then
        syscall_suite_checks
        return
    fi

    return 0
}

run_ltp_suite_tests() {

    : "${suite:?}"

    if ! check_suite_prerequisites "${suite}"; then
        [[ ${ignore_checks} ]] || return 1
    fi

    # Check if we run on top of Qemu
    if (( $(find /sys/devices -iname "*virtio*" | wc -l) )); then
        local -x LTP_VIRT_OVERRIDE="other"
    fi

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
