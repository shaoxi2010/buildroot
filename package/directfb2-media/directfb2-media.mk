################################################################################
#
# directfb2-media
#
################################################################################

DIRECTFB2_MEDIA_VERSION = 8f8cb02a3d67a3eb9726ca2927061e2697b7f2de
DIRECTFB2_MEDIA_SITE = "https://github.com/directfb2/DirectFB2-media"
DIRECTFB2_MEDIA_SITE_METHOD = git
DIRECTFB2_MEDIA_LICENSE = LGPL-2.1
DIRECTFB2_MEDIA_LICENSE_FILES = COPYING
DIRECTFB2_MEDIA_DEPENDENCIES = directfb2
DIRECTFB2_MEDIA_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_FFMPEG), y)
DIRECTFB2_MEDIA_DEPENDENCIES += ffmpeg	
endif

ifeq ($(BR2_PACKAGE_FREETYPE), y)
DIRECTFB2_MEDIA_DEPENDENCIES += freetype
endif

ifeq ($(BR2_PACKAGE_LIBHEIF), y)
DIRECTFB2_MEDIA_DEPENDENCIES += libheif
endif

ifeq ($(BR2_PACKAGE_GSTREAMER1), y)
DIRECTFB2_MEDIA_DEPENDENCIES += gstreamer1
endif

ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2), y)
DIRECTFB2_MEDIA_DEPENDENCIES += imlib2
endif

ifeq ($(BR2_PACKAGE_JASPER), y)
DIRECTFB2_MEDIA_DEPENDENCIES += jasper
endif

ifeq ($(BR2_PACKAGE_LIBJPEG), y)
DIRECTFB2_MEDIA_DEPENDENCIES += libjpeg
endif


ifeq ($(BR2_PACKAGE_LIBJXL), y)
DIRECTFB2_MEDIA_DEPENDENCIES += libjxl
endif

ifeq ($(BR2_PACKAGE_LIBPNG), y)
DIRECTFB2_MEDIA_DEPENDENCIES += libpng
endif

ifeq ($(BR2_PACKAGE_CAIRO_SVG), y)
DirectFB2_MEDIA_DEPENDENCIES += cairo
endif

ifeq ($(BR2_PACKAGE_LIBTIFF), y)
DIRECTFB2_MEDIA_DEPENDENCIES += libtiff
endif

$(eval $(meson-package))
