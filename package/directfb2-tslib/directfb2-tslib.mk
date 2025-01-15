################################################################################
#
# directfb2-tslib
#
################################################################################

DIRECTFB2_TSLIB_VERSION = ce00eca5a33f46ec824348cb85e9196d0d5cc48b
DIRECTFB2_TSLIB_SITE = "https://github.com/directfb2/DirectFB2-tslib"
DIRECTFB2_TSLIB_SITE_METHOD = git
DIRECTFB2_TSLIB_LICENSE = GPL-2.0
DIRECTFB2_TSLIB_LICENSE_FILES = COPYING
DIRECTFB2_TSLIB_DEPENDENCIES = directfb2 tslib

$(eval $(meson-package))
