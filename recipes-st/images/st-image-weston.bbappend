inherit populate_sdk_qt5

IMAGE_INSTALL += " \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-tools \
    qtdeclarative-qmlplugins \
    qtquickcontrols2-qmlplugins \
    qtwayland \
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
	sd-card-system-upgrade \
	ppp \
	usb-modeswitch \
	ppp-dialin \
	libiio \
	packagegroup-st-demo \
	libftdi \
"
