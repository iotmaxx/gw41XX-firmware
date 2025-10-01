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
PACKAGES-$(PTXCONF_SYSCONFIG) += sysconfig

SYSCONFIG_VERSION := 0.1
#
# Paths and names
#

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(SYSCONFIG_SOURCE):
#	@$(call targetinfo)
#	@$(call get, SYSCONFIG)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#SYSCONFIG_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
SYSCONFIG_CONF_TOOL	:= NO
#SYSCONFIG_CONF_OPT	:= 

#$(STATEDIR)/sysconfig.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, SYSCONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/sysconfig.compile:
#	@$(call targetinfo)
#	@$(call world/compile, SYSCONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/sysconfig.install:
#	@$(call targetinfo)
#	@$(call world/install, SYSCONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/sysconfig.targetinstall:
	@$(call targetinfo)

	@$(call install_init, sysconfig)
	@$(call install_fixup, sysconfig,PRIORITY,optional)
	@$(call install_fixup, sysconfig,SECTION,base)
	@$(call install_fixup, sysconfig,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, sysconfig,DESCRIPTION,missing)

	@$(call install_alternative_tree, sysconfig, 0, 0, /etc/sysconfig)

	@$(call install_finish, sysconfig)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/sysconfig.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, SYSCONFIG)

# vim: ft=make
