################################################################################
#
# picom
#
################################################################################

PICOM_VERSION = a456d438d0a681365d90a8adbf0941cede41aaa9
PICOM_SITE = "https://github.com/yshui/picom"
PICOM_SITE_METHOD = git
PICOM_LICENSE = MPL-2.0
PICOM_LICENSE_FILES = COPYING
PICOM_DEPENDENCIES += xlib_libX11 libxcb xcb-proto xcb-util xlib_libXdamage xlib_libXfixes \
	xcb-util-renderutil xlib_libXrender xcb-util-image xlib_libXcomposite xlib_libXpresent \
	pixman libconfig libev uthash 

ifeq ($(BR2_PICOM_USE_OPENGL), y)
PICOM_CONF_OPTS += -Dopengl=true
PICOM_DEPENDENCIES += libegl libgl libepoxy
else
PICOM_CONF_OPTS += -Dopengl=false
endif

ifeq ($(BR2_PACKAGE_PCRE2), y)
PICOM_CONF_OPTS += -Dregex=true
PICOM_DEPENDENCIES += pcre2
else
PICOM_CONF_OPTS += -Dregex=false
endif

ifeq ($(BR2_PACKAGE_DBUS), y)
PICOM_CONF_OPTS += -Ddbus=true
PICOM_DEPENDENCIES += dbus
else
PICOM_CONF_OPTS += -Ddbus=false
endif

# Install the systemd unit only when nodm nor xdm aren't enabled, as
# they would be responsible for starting the server.
ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
define PICOM_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 package/picom/picom.service \
		$(TARGET_DIR)/usr/lib/systemd/system/picom.service
endef
endif

# Install the init script only when neither nodm nor xdm are enabled, as
# they would be responsible for starting the server.
ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
define PICOM_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/picom/S45picom \
		$(TARGET_DIR)/etc/init.d/S45picom
endef
endif

$(eval $(meson-package))
