################################################################################
#
# xlibinput-calibrator
#
################################################################################

XLIBINPUT_CALIBRATOR_VERSION = c77fc1f786554c4ff8b9eaddb6d8ff4d0b78bf1c
XLIBINPUT_CALIBRATOR_SITE = https://github.com/kreijack/xlibinput_calibrator
XLIBINPUT_CALIBRATOR_SITE_METHOD = git
XLIBINPUT_CALIBRATOR_LICENSE = MIT
XLIBINPUT_CALIBRATOR_LICENSE_FILES = LICENSE.txt

XLIBINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi xlib_libXrandr

define XLIBINPUT_CALIBRATOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define XLIBINPUT_CALIBRATOR_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
endef

$(eval $(generic-package))