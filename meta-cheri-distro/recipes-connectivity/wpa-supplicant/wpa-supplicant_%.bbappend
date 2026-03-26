
FILESEXTRAPATHS:append := ":${THISDIR}/wpa-supplicant"

SRC_URI:append = " \
  file://0001-nl80211-modify-mask-to-stay-in-representable-range.patch \
"
