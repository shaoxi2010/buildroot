################################################################################
#
# qt5tools
#
################################################################################

QT5TOOLS_VERSION = d438130ec83b23e6840ff45dd7db55c065e3c2c3
QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2

QT5TOOLS_INSTALL_STAGING = YES
QT5TOOLS_SYNC_QT_HEADERS = YES

# linguist tools compile conditionally on qtHaveModule(qmldevtools-private),
# but the condition is used only used to decide if lupdate will support
# parsing qml files (via setting QT_NO_QML define), no linking against
# target qt5 will happen
ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5TOOLS_DEPENDENCIES += qt5declarative
endif

QT5TOOLS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
	linguist/lconvert linguist/lrelease linguist/lupdate
QT5TOOLS_INSTALL_STAGING_DIR_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
	linguist

ifeq ($(BR2_PACKAGE_QT5TOOLS_QDOC_TOOL),y)
QT5TOOLS_BUILD_DIRS_y += qdoc
QT5TOOLS_INSTALL_STAGING_DIR_y += qdoc
QT5TOOLS_DEPENDENCIES += host-clang
endif

QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool

QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTDIAG) += qtdiag
QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTDIAG) += qtdiag

QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths

QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo

define QT5TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) sub-src-qmake_all
	$(foreach p,$(QT5TOOLS_BUILD_DIRS_y), \
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
endef

# use install target to copy cmake module files
define QT5TOOLS_INSTALL_STAGING_CMDS
	$(foreach p,$(QT5TOOLS_INSTALL_STAGING_DIR_y), \
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p) install$(sep))
endef

define QT5TOOLS_INSTALL_TARGET_CMDS
	$(foreach p,$(QT5TOOLS_INSTALL_TARGET_y), \
		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
endef

$(eval $(qmake-package))
QT5TOOLS_IGNORE_HASH_ERRORS = YES
