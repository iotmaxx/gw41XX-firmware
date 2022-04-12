# -*-makefile-*-
#
# Copyright (C) 2022 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_QFLASH) += qflash

#
# Paths and names
#
QFLASH_VERSION	:= 2.0
QFLASH		:= qflash-$(QFLASH_VERSION)
QFLASH_URL		:= file://local_src/qflash
QFLASH_DIR		:= $(BUILDDIR)/$(QFLASH)
QFLASH_LICENSE	:= unknown
QFLASH_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/qflash.extract:
#	@$(call targetinfo)
#	@$(call clean, $(QFLASH_DIR))
#	@$(call extract, QFLASH)
#	@$(call patchin, QFLASH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#QFLASH_PATH	:= PATH=$(CROSS_PATH)
QFLASH_CONF_TOOL	:= NO
QFLASH_MAKE_ENV	:= $(CROSS_ENV)

#$(STATEDIR)/qflash.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, QFLASH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/qflash.compile:
#	@$(call targetinfo)
#	@$(call world/compile, QFLASH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/qflash.install:
#	@$(call targetinfo)
#	@$(call world/install, QFLASH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qflash.targetinstall:
	@$(call targetinfo)

	@$(call install_init, qflash)
	@$(call install_fixup, qflash,PRIORITY,optional)
	@$(call install_fixup, qflash,SECTION,base)
	@$(call install_fixup, qflash,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, qflash,DESCRIPTION,missing)

#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
	@$(call install_copy, qflash, 0, 0, 0755, $(QFLASH_DIR)/qflash, /usr/bin/qflash)

	@$(call install_finish, qflash)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/qflash.clean:
	@$(call targetinfo)
	@-cd $(QFLASH_DIR) && \
		$(QFLASH_ENV) $(QFLASH_PATH) $(MAKE) clean
	@$(call clean_pkg, QFLASH)

# vim: syntax=make
