# -*-makefile-*-
#
# Copyright (C) 2025 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_CONFIG_EARLY_MOUNT) += config-early-mount

#
# Paths and names
#
CONFIG_EARLY_MOUNT_VERSION	:= 0.1.0
CONFIG_EARLY_MOUNT_MD5		:=
CONFIG_EARLY_MOUNT		:= config-early-mount-$(CONFIG_EARLY_MOUNT_VERSION)
CONFIG_EARLY_MOUNT_SUFFIX	:= 
#CONFIG_EARLY_MOUNT_URL		:= /$(CONFIG_EARLY_MOUNT).$(CONFIG_EARLY_MOUNT_SUFFIX)
#CONFIG_EARLY_MOUNT_SOURCE	:= $(SRCDIR)/$(CONFIG_EARLY_MOUNT).$(CONFIG_EARLY_MOUNT_SUFFIX)
CONFIG_EARLY_MOUNT_DIR		:= $(BUILDDIR)/$(CONFIG_EARLY_MOUNT)
CONFIG_EARLY_MOUNT_LICENSE	:= ignore
CONFIG_EARLY_MOUNT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(CONFIG_EARLY_MOUNT_SOURCE):
	@$(call targetinfo)
#	@$(call get, CONFIG_EARLY_MOUNT)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#CONFIG_EARLY_MOUNT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
CONFIG_EARLY_MOUNT_CONF_TOOL	:= NO
#CONFIG_EARLY_MOUNT_CONF_OPT	:= 

#$(STATEDIR)/config-early-mount.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, CONFIG_EARLY_MOUNT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/config-early-mount.compile:
	@$(call targetinfo)
#	@$(call world/compile, CONFIG_EARLY_MOUNT)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/config-early-mount.install:
	@$(call targetinfo)
#	@$(call world/install, CONFIG_EARLY_MOUNT)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/config-early-mount.targetinstall:
	@$(call targetinfo)

	@$(call install_init, config-early-mount)
	@$(call install_fixup, config-early-mount,PRIORITY,optional)
	@$(call install_fixup, config-early-mount,SECTION,base)
	@$(call install_fixup, config-early-mount,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, config-early-mount,DESCRIPTION,missing)

	@$(call install_alternative, config-early-mount, 0, 0, 0644, /etc/systemd/system/config.mount)

	@$(call install_finish, config-early-mount)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/config-early-mount.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, CONFIG_EARLY_MOUNT)

# vim: syntax=make
