################################################################################
#
# FREETDS
#
################################################################################

FREETDS_VERSION = 1.3.21
FREETDS_SITE = https://www.freetds.org/files/stable
FREETDS_SOURCE = freetds-$(FREETDS_VERSION).tar.gz
FREETDS_LICENSE = LGPL-2.0+
FREETDS_LICENSE_FILES = LICENSE
FREETDS_DEPENDENCIES = unixodbc

FREETDS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
FREETDS_CONF_OPTS += -DWITH_OPENSSL=ON
FREETDS_DEPENDENCIES += openssl
else
FREETDS_CONF_OPTS += -DWITH_OPENSSL=OFF
endif

$(eval $(cmake-package))
