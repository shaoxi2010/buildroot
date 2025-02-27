################################################################################
#
# qt5quickcontrols
#
################################################################################

QT5QUICKCONTROLS_VERSION = fe98f874f89abe9b96edadb812cfa9b1488679f0
QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
QT5QUICKCONTROLS_INSTALL_STAGING = YES
QT5QUICKCONTROLS_SYNC_QT_HEADERS = YES

QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL

$(eval $(qmake-package))
QT5QUICKCONTROLS_IGNORE_HASH_ERRORS = YES
