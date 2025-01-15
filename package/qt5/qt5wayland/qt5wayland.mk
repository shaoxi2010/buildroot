################################################################################
#
# qt5wayland
#
################################################################################

QT5WAYLAND_VERSION = 826dcefebc61eb260ef89f013a474d635c6abb18
QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
QT5WAYLAND_DEPENDENCIES = wayland
QT5WAYLAND_INSTALL_STAGING = YES
QT5WAYLAND_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
QT5WAYLAND_DEPENDENCIES += qt5declarative
endif

ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
QT5WAYLAND_DEPENDENCIES += libxkbcommon
endif

QT5WAYLAND_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5WAYLAND_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
QT5WAYLAND_CONF_OPTS += CONFIG+=wayland-compositor
endif

$(eval $(qmake-package))
QT5WAYLAND_IGNORE_HASH_ERRORS = YES
