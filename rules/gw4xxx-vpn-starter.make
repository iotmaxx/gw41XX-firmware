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
PACKAGES-$(PTXCONF_GW4XXX_VPN_STARTER) += gw4xxx-vpn-starter

#
# Paths and names
#
GW4XXX_VPN_STARTER_VERSION	:= 0.5.0
GW4XXX_VPN_STARTER_MD5		:= 0d36c3168d05cf00593d63c81ca8ca97
GW4XXX_VPN_STARTER		:= gw4xxx-vpn-starter-$(GW4XXX_VPN_STARTER_VERSION)
GW4XXX_VPN_STARTER_SUFFIX	:= tar.gz
GW4XXX_VPN_STARTER_URL		:= http://172.17.0.1:8080/iotmaxx/$(GW4XXX_VPN_STARTER).$(GW4XXX_VPN_STARTER_SUFFIX)
GW4XXX_VPN_STARTER_SOURCE	:= $(SRCDIR)/$(GW4XXX_VPN_STARTER).$(GW4XXX_VPN_STARTER_SUFFIX)
GW4XXX_VPN_STARTER_DIR		:= $(BUILDDIR)/$(GW4XXX_VPN_STARTER)
GW4XXX_VPN_STARTER_LICENSE	:= GPL-3.0-or-later
GW4XXX_VPN_STARTER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(GW4XXX_VPN_STARTER_SOURCE):
#	@$(call targetinfo)
#	@$(call get, GW4XXX_VPN_STARTER)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

GW4XXX_VPN_STARTER_CONF_TOOL    := NO
GW4XXX_VPN_STARTER_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
#GW4XXX_VPN_STARTER_CONF_TOOL	:= python3
#GW4XXX_VPN_STARTER_CONF_OPT	:= 

#$(STATEDIR)/gw4xxx-vpn-starter.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, GW4XXX_VPN_STARTER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-vpn-starter.compile:
	@$(call targetinfo)
#	@$(call world/compile, GW4XXX_VPN_STARTER)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-vpn-starter.install:
	@$(call targetinfo)
#	@$(call world/install, GW4XXX_VPN_STARTER)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gw4xxx-vpn-starter.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gw4xxx-vpn-starter)
	@$(call install_fixup, gw4xxx-vpn-starter,PRIORITY,optional)
	@$(call install_fixup, gw4xxx-vpn-starter,SECTION,base)
	@$(call install_fixup, gw4xxx-vpn-starter,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, gw4xxx-vpn-starter,DESCRIPTION,missing)

	@$(call install_copy, gw4xxx-vpn-starter, 0, 0, 0755, $(GW4XXX_VPN_STARTER_DIR)/etc/rc.once.d/vpn_starter, /etc/rc.once.d/vpn_starter)
	@$(call install_copy, gw4xxx-vpn-starter, 0, 0, 0755, $(GW4XXX_VPN_STARTER_DIR)/etc/NetworkManager/dispatcher.d/startOpenVPN, /etc/NetworkManager/dispatcher.d/startOpenVPN)

	@$(call install_finish, gw4xxx-vpn-starter)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/gw4xxx-vpn-starter.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, GW4XXX_VPN_STARTER)

# vim: syntax=make
