################################################################################
#
# dfbterm
#
################################################################################

DFBTERM_VERSION = 0e78750b5e58655d521da54540dc0a9bdca2f840
DFBTERM_SITE = "https://github.com/directfb2/DFBTerm"
DFBTERM_SITE_METHOD = git
DFBTERM_LICENSE = GPL-2.0
DFBTERM_LICENSE_FILES = COPYING
DFBTERM_DEPENDENCIES = directfb2 directfb2-lite

$(eval $(meson-package))
