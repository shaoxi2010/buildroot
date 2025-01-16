################################################################################
#
# xdriver_xf86-video-fbdev
#
################################################################################

XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.0
XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
XDRIVER_XF86_VIDEO_FBDEV_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xorgproto

define XDRIVER_XF86_VIDEO_FBDEV_POST_INSTALL_CONFIG
	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/X11/xorg.conf.d
	$(INSTALL) -m 644 package/x11r7/xdriver_xf86-video-fbdev/10-fbdev.conf $(TARGET_DIR)/etc/X11/xorg.conf.d/
endef

XDRIVER_XF86_VIDEO_FBDEV_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_FBDEV_POST_INSTALL_CONFIG
$(eval $(autotools-package))
