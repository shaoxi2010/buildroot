################################################################################
#
# directfb2-tools
#
################################################################################

DIRECTFB2_TOOLS_VERSION = 679838c281cbe7849011f7f6db1c815167c44fee
DIRECTFB2_TOOLS_SITE = "https://github.com/directfb2/DirectFB2-tools"
DIRECTFB2_TOOLS_SITE_METHOD = git
DIRECTFB2_TOOLS_LICENSE = GPL-2.0
DIRECTFB2_TOOLS_LICENSE_FILES = COPYING
DIRECTFB2_TOOLS_DEPENDENCIES = directfb2

$(eval $(meson-package))
