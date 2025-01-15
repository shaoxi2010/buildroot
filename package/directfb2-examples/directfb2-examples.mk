################################################################################
#
# directfb2-examples
#
################################################################################

DIRECTFB2_EXAMPLES_VERSION = d627550430407ce6f1e42a861985ec42c0f4ac19
DIRECTFB2_EXAMPLES_SITE = "https://github.com/directfb2/DirectFB-examples"
DIRECTFB2_EXAMPLES_SITE_METHOD = git
DIRECTFB2_EXAMPLES_LICENSE = MIT
DIRECTFB2_EXAMPLES_LICENSE_FILES = COPYING
DIRECTFB2_EXAMPLES_DEPENDENCIES = directfb2 directfb2-csource

ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_1),y)
DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=1
else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_VERSION_2),y)
DIRECTFB2_EXAMPLES_CONF_OPTS += -Ddirectfbgl=2
endif

ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)),)
DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL)
endif

ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)),)
DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-cflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_CFLAGS)
endif

ifneq ($(call qstrip, $(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)),)
DIRECTFB2_EXAMPLES_CONF_OPTS += -Dgl-ldflags=$(BR2_PACKAGE_DIRECTFB2_EXAMPLES_GL_LDFLAGS)
endif

# Disabled for now as directfb2-csource currently does not generate
# pkgconfig file
#
# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_DGIFF),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dfont-headers=dgiff
# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_FONT_HEADER_ttf),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dfont-headers=ttf
# endif

# Disabled for now as directfb2-csource currently does not generate
# pkgconfig file
#
# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_DFIFF),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dimage-headers=dfiff
# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_PNG),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dimage-headers=png
# endif

# Disabled for now as directfb2-csource currently does not generate
# pkgconfig file
#
# ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_DFVFF),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=dfvff
# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_M2V),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=m2v
# else ifeq ($(BR2_PACKAGE_DIRECTFB2_EXAMPLES_VIDEO_HEADERS_264),y)
# DIRECTFB2_EXAMPLES_CONF_OPTS += -Dvideo-headers=264
# endif

$(eval $(meson-package))
