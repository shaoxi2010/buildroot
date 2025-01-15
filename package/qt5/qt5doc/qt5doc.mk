################################################################################
#
# qt5doc
#
################################################################################

QT5DOC_VERSION = 06eb4742b5178596cfe2b78001cd8d99cd4379b1
QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
QT5DOC_DEPENDENCIES = qt5declarative
QT5DOC_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS),y)
QT5DOC_DEPENDENCIES += qt5quickcontrols
endif

ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
QT5DOC_DEPENDENCIES += qt5quickcontrols2
endif

ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
QT5DOC_DEPENDENCIES += qt5xmlpatterns
endif

QT5DOC_LICENSE = GFDL-1.3
QT5DOC_LICENSE_FILES = LICENSE.FDL

$(eval $(qmake-package))
QT5DOC_IGNORE_HASH_ERRORS = YES
