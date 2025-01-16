################################################################################
#
# qvrtualkeyboard
#
################################################################################

QVIRTUALKEYBOARD_VERSION = 270b618eb227b355c10f60aa31cbd9e5f24a78e3
QVIRTUALKEYBOARD_SITE = https://gitee.com/shaoxi2010/QVirtualKeyboard
QVIRTUALKEYBOARD_SITE_METHOD = git
QVIRTUALKEYBOARD_DEPENDENCIES = qt5base
QVIRTUALKEYBOARD_IGNORE_HASH_ERRORS = YES

QVIRTUALKEYBOARD_LICENSE = Apache-2.0

define QVIRTUALKEYBOARD_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) qmake .)
endef

define QVIRTUALKEYBOARD_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QVIRTUALKEYBOARD_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) install -d -m 0755 \
		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts/
	$(TARGET_MAKE_ENV) install -m 0755 \
		$(@D)/bin/plugins/platforminputcontexts/libQt5SoftKeyboard.so \
		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts/
endef

$(eval $(generic-package))
