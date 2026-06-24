##############################################################
#
# AESDCHAR
#
##############################################################

AESDCHAR_VERSION = 'a3faff66f75578a8d42b6ba0b9fce52582b2587c'
AESDCHAR_SITE = 'git@github.com:cu-ecen-aeld/assignment-8-Rizz20.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S98aesdchar $(TARGET_DIR)/etc/init.d/S98aesdchar
endef

$(eval $(kernel-module))
$(eval $(generic-package))
