################################################################################
#
# qt5sensors
#
################################################################################

QT5SENSORS_VERSION = b97c60bee7505eb3901579abc4751f35ba7b303e
QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
QT5SENSORS_INSTALL_STAGING = YES
QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
QT5SENSORS_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5SENSORS_DEPENDENCIES += qt5declarative
endif

$(eval $(qmake-package))
QT5SENSORS_IGNORE_HASH_ERRORS = YES
