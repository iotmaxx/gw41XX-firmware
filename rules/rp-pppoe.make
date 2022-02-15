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
PACKAGES-$(PTXCONF_RP_PPPOE) += rp-pppoe

#
# Paths and names
#
RP_PPPOE_VERSION	:= 3.15
RP_PPPOE_MD5		:= 5b6e19e7a31ff228fafd2e62f023e521
RP_PPPOE		:= rp-pppoe-$(RP_PPPOE_VERSION)
RP_PPPOE_SUFFIX		:= tar.gz
RP_PPPOE_URL		:= https://dianne.skoll.ca/projects/rp-pppoe/download/$(RP_PPPOE).$(RP_PPPOE_SUFFIX)
RP_PPPOE_SOURCE		:= $(SRCDIR)/$(RP_PPPOE).$(RP_PPPOE_SUFFIX)
RP_PPPOE_DIR		:= $(BUILDDIR)/$(RP_PPPOE)
RP_PPPOE_LICENSE	:= GPL-2.0-only
RP_PPPOE_LICENSE_FILES	:=
RP_PPPOE_SUBDIR		:= src
# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(RP_PPPOE_SOURCE):
#	@$(call targetinfo)
#	@$(call get, RP_PPPOE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#RP_PPPOE_CONF_ENV	:= $(CROSS_ENV)

#
# autoconf
#
RP_PPPOE_CONF_TOOL	:= autoconf
RP_PPPOE_CONF_OPT	:=  \
	--enable-plugin=$(PPP_DIR)	\
	$(CROSS_AUTOCONF_USR)

#$(STATEDIR)/rp-pppoe.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, RP_PPPOE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/rp-pppoe.compile:
#	@$(call targetinfo)
#	@$(call world/compile, RP_PPPOE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/rp-pppoe.install:
#	@$(call targetinfo)
#	@$(call world/install, RP_PPPOE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/rp-pppoe.targetinstall:
	@$(call targetinfo)

	@$(call install_init, rp-pppoe)
	@$(call install_fixup, rp-pppoe,PRIORITY,optional)
	@$(call install_fixup, rp-pppoe,SECTION,base)
	@$(call install_fixup, rp-pppoe,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, rp-pppoe,DESCRIPTION,missing)

	@$(call install_tree, rp-pppoe, 0, 0, -, /etc)
	@$(call install_tree, rp-pppoe, 0, 0, -, /usr/sbin)

	@$(call install_finish, rp-pppoe)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/rp-pppoe.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, RP_PPPOE)

# vim: syntax=make
