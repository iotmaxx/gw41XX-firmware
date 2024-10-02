# -*-makefile-*-
#
# Copyright (C) 2024 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PREPARE_OPT_MOUNT) += prepare_opt_mount

#
# Paths and names
#
PREPARE_OPT_MOUNT_VERSION	:= 0.1.0
#PREPARE_OPT_MOUNT_MD5		:=
PREPARE_OPT_MOUNT		:= prepare_opt_mount-$(PREPARE_OPT_MOUNT_VERSION)
#PREPARE_OPT_MOUNT_SUFFIX	:= 
#PREPARE_OPT_MOUNT_URL		:= /$(PREPARE_OPT_MOUNT).$(PREPARE_OPT_MOUNT_SUFFIX)
#PREPARE_OPT_MOUNT_SOURCE	:= $(SRCDIR)/$(PREPARE_OPT_MOUNT).$(PREPARE_OPT_MOUNT_SUFFIX)
#PREPARE_OPT_MOUNT_DIR		:= $(BUILDDIR)/$(PREPARE_OPT_MOUNT)
#PREPARE_OPT_MOUNT_LICENSE	:= unknown
#PREPARE_OPT_MOUNT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PREPARE_OPT_MOUNT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PREPARE_OPT_MOUNT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PREPARE_OPT_MOUNT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PREPARE_OPT_MOUNT_CONF_TOOL	:= NO
#PREPARE_OPT_MOUNT_CONF_OPT	:= 

#$(STATEDIR)/prepare_opt_mount.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PREPARE_OPT_MOUNT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/prepare_opt_mount.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PREPARE_OPT_MOUNT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/prepare_opt_mount.install:
#	@$(call targetinfo)
#	@$(call world/install, PREPARE_OPT_MOUNT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/prepare_opt_mount.targetinstall:
	@$(call targetinfo)

	@$(call install_init, prepare_opt_mount)
	@$(call install_fixup, prepare_opt_mount,PRIORITY,optional)
	@$(call install_fixup, prepare_opt_mount,SECTION,base)
	@$(call install_fixup, prepare_opt_mount,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, prepare_opt_mount,DESCRIPTION,missing)

	@$(call install_alternative, prepare_opt_mount, 0, 0, 0755, /usr/sbin/ensureext4fs)
	@$(call install_alternative, prepare_opt_mount, 0, 0, 0644, /etc/systemd/system/local-fs-prepare-opt.service)
	@$(call install_link, prepare_opt_mount, ../local-fs-prepare-opt.service, /etc/systemd/system/local-fs.target.wants/local-fs-prepare-opt.service)

	@$(call install_finish, prepare_opt_mount)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/prepare_opt_mount.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PREPARE_OPT_MOUNT)

# vim: syntax=make
