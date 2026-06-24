##############################################################
#
# AESDCHAR
#
##############################################################

AESDCHAR_VERSION = '7a484d2770dc028ff066b19442d0a8302b69d1cf'
AESDCHAR_SITE = 'git@github.com:cu-ecen-aeld/assignment-8-Rizz20.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

define AESDCHAR_INSTALL_SCRIPTS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S98aesdchar $(TARGET_DIR)/etc/init.d/S98aesdchar
endef

AESDCHAR_POST_INSTALL_TARGET_HOOKS += AESDCHAR_INSTALL_SCRIPTS

$(eval $(kernel-module))
$(eval $(generic-package))
