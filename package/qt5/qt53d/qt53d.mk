################################################################################
#
# qt53d
#
################################################################################

QT53D_VERSION = 84b2eae328fdff5d633af0a9563272c93f6ec074
QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
QT53D_DEPENDENCIES = qt5declarative
QT53D_INSTALL_STAGING = YES
QT53D_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_ASSIMP),y)
QT53D_DEPENDENCIES += assimp
endif

QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3

$(eval $(qmake-package))
QT53D_IGNORE_HASH_ERRORS = YES
