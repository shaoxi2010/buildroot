################################################################################
#
# directfb2-gles
#
################################################################################

DIRECTFB2_GLES_VERSION = ec9460361b054a9b0a52f6b20cd582ff0e6f31f9
DIRECTFB2_GLES_SITE = "https://github.com/directfb2/DirectFB2-gles2"
DIRECTFB2_GLES_SITE_METHOD = git
DIRECTFB2_GLES_LICENSE = GPL-2.0
DIRECTFB2_GLES_LICENSE_FILES = COPYING
DIRECTFB2_GLES_DEPENDENCIES = directfb2 libgles

$(eval $(meson-package))
