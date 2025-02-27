################################################################################
#
# qt5webchannel
#
################################################################################

QT5WEBCHANNEL_VERSION = a8980b1331e5fddcb3c5d843add898306d076662
QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
QT5WEBCHANNEL_INSTALL_STAGING = YES
QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
QT5WEBCHANNEL_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
QT5WEBCHANNEL_LICENSE += , BSD-3-Clause (examples)
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
endif

define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
	$(INSTALL) -m 0644 -D $(@D)/examples/webchannel/shared/qwebchannel.js \
		$(TARGET_DIR)/var/www/qwebchannel.js
endef
QT5WEBCHANNEL_POST_INSTALL_TARGET_HOOKS += QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT

$(eval $(qmake-package))
QT5WEBCHANNEL_IGNORE_HASH_ERRORS = YES
