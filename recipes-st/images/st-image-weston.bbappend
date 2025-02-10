IMAGE_INSTALL += " \
    gstreamer1.0 \
    gstreamer1.0-plugins-good \
"

CORE_IMAGE_EXTRA_INSTALL += " \
	net-tools \
	openvpn \
	systemd-networkd-configuration \
	netplan \
	networkmanager \
	iproute2 \
	ppp \
	usb-modeswitch \
	ppp-dialin \
	libiio \
	packagegroup-st-demo \
	libftdi \
	ffmpeg \
    lvgl \
    lvgl-demo-fb \
    modemmanager \
"
