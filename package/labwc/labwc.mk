################################################################################
#
# labwc
#
################################################################################

LABWC_VERSION = 0.6.6
LABWC_SITE = $(call github,labwc,labwc,$(LABWC_VERSION))
LABWC_LICENSE = MIT
LABWC_LICENSE_FILES = LICENSE
LABWC_INSTALL_STAGING = YES
LABWC_DEPENDENCIES = wlroots wayland wayland-protocols libinput libxkbcommon \
	libpng \
	cairo libglib2 pango libxml2

ifeq ($(BR2_PACKAGE_LABWC_XWAYLAND),y)
LABWC_DEPENDENCIES += libxcb xwayland
LABWC_CONF_OPTS += -Dxwayland=enabled
else
LABWC_CONF_OPTS += -Dxwayland=disabled
endif

ifeq ($(BR2_PACKAGE_LIBRSVG),y)
LABWC_DEPENDENCIES += librsvg
LABWC_CONF_OPTS += -Dsvg=enabled
else
LABWC_CONF_OPTS += -Dsvg=disabled
endif

$(eval $(meson-package))
