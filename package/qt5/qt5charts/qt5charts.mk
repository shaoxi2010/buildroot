################################################################################
#
# qt5charts
#
################################################################################

QT5CHARTS_VERSION = 0c97aae7dc242ac0710e09397672ad878761157a
QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
QT5CHARTS_INSTALL_STAGING = YES
QT5CHARTS_SYNC_QT_HEADERS = YES

QT5CHARTS_LICENSE = GPL-3.0
QT5CHARTS_LICENSE_FILES = LICENSE.GPL3

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5CHARTS_DEPENDENCIES += qt5declarative
endif

$(eval $(qmake-package))
QT5CHARTS_IGNORE_HASH_ERRORS = YES
