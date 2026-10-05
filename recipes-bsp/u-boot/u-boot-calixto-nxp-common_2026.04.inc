DESCRIPTION = "i.MX U-Boot suppporting i.MX reference boards."

LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH}"

UBOOT_SRC ?= "git://github.com/Novice-calixto/imx8mp-uboot.git;protocol=https"
SRCBRANCH = "2026.04"
LOCALVERSION ?= "-${SRCBRANCH}"
SRCREV = "c5e563bcd4bd85dbde524deb270a1ac21e7b8448"

DEPENDS += " \
    bc-native \
    bison-native \
    dtc-native \
    flex-native \
    gnutls-native \
    python3-setuptools-native \
    xxd-native \
    efitools-native \
"

B = "${WORKDIR}/build"

inherit fsl-u-boot-localversion pkgconfig

BOOT_TOOLS = "imx-boot-tools"
