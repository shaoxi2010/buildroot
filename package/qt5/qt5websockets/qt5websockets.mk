################################################################################
#
# qt5websockets
#
################################################################################

QT5WEBSOCKETS_VERSION = 2c9ab820248797b98439c4db651c0a80f015b146
QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
QT5WEBSOCKETS_INSTALL_STAGING = YES
QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
QT5WEBSOCKETS_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
QT5WEBSOCKETS_LICENSE += , BSD-3-Clause (examples)
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
endif

$(eval $(qmake-package))
QT5WEBSOCKETS_IGNORE_HASH_ERRORS = YES
