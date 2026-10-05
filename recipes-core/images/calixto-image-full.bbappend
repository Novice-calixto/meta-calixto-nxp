IMAGE_INSTALL:append = " packagegroup-imx-gopoint"

ROOTFS_POSTPROCESS_COMMAND:append:mx8-nxp-bsp = "install_demo; "

install_demo() {
    if ! grep -q "icon=${GPNT_APPS_FOLDER}/icon/icon_demo_launcher.png" ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    then
       printf "\n[launcher]\nicon=${GPNT_APPS_FOLDER}/icon/icon_demo_launcher.png\npath=/usr/bin/gopoint\n\n[launcher]\nicon=/usr/share/weston/terminal.png\npath=/usr/bin/weston-terminal" >> ${IMAGE_ROOTFS}${sysconfdir}/xdg/weston/weston.ini
    fi
    if ! grep -q "HOME=/root/" ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    then
        printf "\nHOME=/root/\nQT_QPA_PLATFORM=wayland" >> ${IMAGE_ROOTFS}${sysconfdir}/default/weston
    fi
}
