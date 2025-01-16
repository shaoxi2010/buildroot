################################################################################
#
# uthash
#
################################################################################

UTHASH_VERSION = 41c357fd74ade4f4b4822c4407d2f51c4558e18d
UTHASH_SITE = "https://github.com/troydhanson/uthash"
UTHASH_SITE_METHOD = git
UTHASH_INSTALL_STAGING = YES

define UTHASH_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0644 -D $(@D)/src/*.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))