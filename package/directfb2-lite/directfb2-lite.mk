################################################################################
#
# directfb2-lite
#
################################################################################

DIRECTFB2_LITE_VERSION = 164bb5eca507c3cee1be2adf3798745f305495d7
DIRECTFB2_LITE_SITE = "https://github.com/directfb2/LiTE"
DIRECTFB2_LITE_SITE_METHOD = git
DIRECTFB2_LITE_LICENSE = LGPL-2.1
DIRECTFB2_LITE_LICENSE_FILES = COPYING
DIRECTFB2_LITE_DEPENDENCIES = directfb2
DIRECTFB2_LITE_INSTALL_STAGING = YES

$(eval $(meson-package))
