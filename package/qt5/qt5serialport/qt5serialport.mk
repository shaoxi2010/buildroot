################################################################################
#
# qt5serialport
#
################################################################################

QT5SERIALPORT_VERSION = aa2ffdbd7295db9e5814070d1432a0b77c59cfce
QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
QT5SERIALPORT_INSTALL_STAGING = YES
QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
QT5SERIALPORT_SYNC_QT_HEADERS = YES

$(eval $(qmake-package))
QT5SERIALPORT_IGNORE_HASH_ERRORS = YES
