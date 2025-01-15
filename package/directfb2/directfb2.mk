################################################################################
#
# directfb2
#
################################################################################

DIRECTFB2_VERSION = 4d6b7ddd8477b4b52aa78ec82a3add28ade0c965
DIRECTFB2_SITE = "https://github.com/directfb2/DirectFB2"
DIRECTFB2_SITE_METHOD = git
DIRECTFB2_LICENSE = LGPL-2.1
DIRECTFB2_LICENSE_FILES = COPYING
DIRECTFB2_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_DIRECTFB2_DRMKMS),y)
DIRECTFB2_CONF_OPTS += -Ddrmkms=true
DIRECTFB2_DEPENDENCIES += libdrm
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_FBDEV),y)
DIRECTFB2_CONF_OPTS += -Dfbdev=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_LINUX_INPUT),y)
DIRECTFB2_CONF_OPTS += -Dlinux_input=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),y)
DIRECTFB2_CONF_OPTS += -Dmmx=true
else ifeq ($(BR2_PACKAGE_DIRECTFB2_MMX),n)
DIRECTFB2_CONF_OPTS += -Dmmx=false
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI),y)
DIRECTFB2_CONF_OPTS += -Dmulti=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_MULTI_KERNEL),y)
DIRECTFB2_CONF_OPTS += -Dmulti-kernel=true
endif

# ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
# DIRECTFB2_CONF_OPTS += -Dneon=true
# else ifeq ($(BR2_PACKAGE_DIRECTFB2_NEON),y)
# DIRECTFB2_CONF_OPTS += -Dneon=false
# endif
#
# DirectFB2 currently has issues enabling NEON. For more details, see:
# https://github.com/directfb2/DirectFB2/issues/142
DIRECTFB2_CONF_OPTS += -Dneon=false

ifeq ($(BR2_PACKAGE_DIRECTFB2_NETWORK),y)
DIRECTFB2_CONF_OPTS += -Dnetwork=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_SENTINELS),y)
DIRECTFB2_CONF_OPTS += -Dsentinels=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_SMOOTH_SCALING),y)
DIRECTFB2_CONF_OPTS += -Dsmooth-scaling=true
endif

ifeq ($(BR2_PACKAGE_DIRECTFB2_DEBUG),y)
DIRECTFB2_CONF_OPTS += -Ddebug=true
endif

$(eval $(meson-package))
