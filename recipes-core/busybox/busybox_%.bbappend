FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:remove = " \
	   https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
	   file://0001-depmod-Ignore-.debug-directories.patch \
           file://busybox-udhcpc-no_deconfig.patch \
	   file://fail_on_no_media.patch \
	   file://recognize_connmand.patch \
           file://busybox-cross-menuconfig.patch \
	   file://makefile-libbb-race.patch \
           file://0001-testsuite-check-uudecode-before-using-it.patch \
           file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
           file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
           file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
           file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
           file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
           file://start-stop-false.patch \
           "
SRC_URI:prepend = " \
  git://github.com/cheri-linux/busybox.git;protocol=https;branch=riscv-cheri \
  file://tar-fix-fallout.patch \
  file://busybox-vi-bias-fix.patch \
  file://0001-cheri-Fix-pointer-handling-in-job-table.patch \
  file://0001-vi-fix-read-outside-of-text-buffer-during-insert.patch \
  file://0002-vi-fix-a-crash-when-inserting-before-the-first-line.patch \
"
SRCREV = "12507073b16c4d0d84f3c895cf2c3e9fd540eef6"
S = "${WORKDIR}/git"
