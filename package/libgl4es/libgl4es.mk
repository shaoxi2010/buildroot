################################################################################
#
# LIBGL4ES
#
################################################################################

LIBGL4ES_VERSION = v1.1.6
LIBGL4ES_SITE = $(call github,ptitSeb,gl4es,$(LIBGL4ES_VERSION))
LIBGL4ES_DEPENDENCIES = libgles
LIBGL4ES_LICENSE = MIT
LIBGL4ES_LICENSE_FILES = LICENSE

LIBGL4ES_INSTALL_STAGING = YES
LIBGL4ES_CONF_OPTS += -DODROID=ON

ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
LIBGL4ES_DEPENDENCIES += libgbm
LIBGL4ES_CONF_OPTS += -DNO_GBM=OFF
else
LIBGL4ES_CONF_OPTS += -DNO_GBM=ON
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBGL4ES_DEPENDENCIES += xlib_libX11
LIBGL4ES_CONF_OPTS += -DNOX11=OFF
else
LIBGL4ES_CONF_OPTS += -DNOX11=ON
endif
$(eval $(cmake-package))
