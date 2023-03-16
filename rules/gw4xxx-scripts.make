# -*-makefile-*-
#
# Copyright (C) 2023 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_GW4XXX_SCRIPTS) += gw4xxx-scripts

#
# Paths and names
#
GW4XXX_SCRIPTS_VERSION	:= 0.6.0
GW4XXX_SCRIPTS_MD5	:= c2fb449f7e28b9cc871720017bcae71e
GW4XXX_SCRIPTS		:= gw4xxx-scripts-$(GW4XXX_SCRIPTS_VERSION)
GW4XXX_SCRIPTS_SUFFIX	:= tar.gz
GW4XXX_SCRIPTS_URL	:= http://172.17.0.1:8080/iotmaxx/$(GW4XXX_SCRIPTS).$(GW4XXX_SCRIPTS_SUFFIX)
GW4XXX_SCRIPTS_SOURCE	:= $(SRCDIR)/$(GW4XXX_SCRIPTS).$(GW4XXX_SCRIPTS_SUFFIX)
GW4XXX_SCRIPTS_DIR	:= $(BUILDDIR)/$(GW4XXX_SCRIPTS)
GW4XXX_SCRIPTS_LICENSE	:= GPL-3.0-or-later
GW4XXX_SCRIPTS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(GW4XXX_SCRIPTS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, GW4XXX_SCRIPTS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#GW4XXX_SCRIPTS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
GW4XXX_SCRIPTS_CONF_TOOL	:= NO
#GW4XXX_SCRIPTS_CONF_OPT	:= 

#$(STATEDIR)/gw4xxx-scripts.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, GW4XXX_SCRIPTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-scripts.compile:
	@$(call targetinfo)
#	@$(call world/compile, GW4XXX_SCRIPTS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-scripts.install:
	@$(call targetinfo)
#	@$(call world/install, GW4XXX_SCRIPTS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-scripts.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gw4xxx-scripts)
	@$(call install_fixup, gw4xxx-scripts,PRIORITY,optional)
	@$(call install_fixup, gw4xxx-scripts,SECTION,base)
	@$(call install_fixup, gw4xxx-scripts,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, gw4xxx-scripts,DESCRIPTION,missing)

	@$(call install_copy, gw4xxx-scripts, 0, 0, 0755, $(GW4XXX_SCRIPTS_DIR)/etc/rc.once.d/trampoline, /etc/rc.once.d/trampoline)
	@$(call install_copy, gw4xxx-scripts, 0, 0, 0755, $(GW4XXX_SCRIPTS_DIR)/etc/rc.once.d/webconfig_userpass, /etc/rc.once.d/webconfig_userpass)
	@$(call install_copy, gw4xxx-scripts, 0, 0, 0755, $(GW4XXX_SCRIPTS_DIR)/etc/rc.once.d/vpn_starter, /etc/rc.once.d/vpn_starter)
	@$(call install_copy, gw4xxx-scripts, 0, 0, 0755, $(GW4XXX_SCRIPTS_DIR)/etc/NetworkManager/dispatcher.d/startOpenVPN, /etc/NetworkManager/dispatcher.d/startOpenVPN)

	@$(call install_finish, gw4xxx-scripts)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/gw4xxx-scripts.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, GW4XXX_SCRIPTS)

# vim: syntax=make