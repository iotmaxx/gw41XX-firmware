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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_SDHEALTH) += python3-gw4xxx-sdhealth

#
# Paths and names
#
PYTHON3_GW4XXX_SDHEALTH_VERSION	:= 0.1.4
PYTHON3_GW4XXX_SDHEALTH_MD5	:= 83be9919c7fefd50da2b1b5833f27b87
PYTHON3_GW4XXX_SDHEALTH		:= sdhealth-$(PYTHON3_GW4XXX_SDHEALTH_VERSION)
PYTHON3_GW4XXX_SDHEALTH_SUFFIX	:= tar.gz
#PYTHON3_GW4XXX_SDHEALTH_URL	:= https://github.com/iotmaxx/sdhealth/archive/refs/tags/$(PYTHON3_GW4XXX_SDHEALTH_VERSION).tar.gz
PYTHON3_GW4XXX_SDHEALTH_URL     := https://api.github.com/repos/iotmaxx/sdhealth/tarball/$(PYTHON3_GW4XXX_SDHEALTH_VERSION)
PYTHON3_GW4XXX_SDHEALTH_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_SDHEALTH).$(PYTHON3_GW4XXX_SDHEALTH_SUFFIX)
PYTHON3_GW4XXX_SDHEALTH_DIR	:= $(BUILDDIR)/$(PYTHON3_GW4XXX_SDHEALTH)
PYTHON3_GW4XXX_SDHEALTH_LICENSE	:= ignore
PYTHON3_GW4XXX_SDHEALTH_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(PYTHON3_GW4XXX_SDHEALTH_SOURCE):
	@$(call targetinfo)
	$(call gh_token_get, PYTHON3_GW4XXX_SDHEALTH)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------
$(STATEDIR)/python3-gw4xxx-sdhealth.extract:
	@$(call targetinfo)
	@$(call clean, $(PYTHON3_GW4XXX_SDHEALTH_DIR))
	$(call gh_token_extract, PYTHON3_GW4XXX_SDHEALTH)
	@$(call patchin, $(PYTHON3_GW4XXX_SDHEALTH))
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_SDHEALTH_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_SDHEALTH_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_SDHEALTH_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-sdhealth.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_SDHEALTH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-sdhealth.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_SDHEALTH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-sdhealth.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_SDHEALTH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-sdhealth.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-sdhealth)
	@$(call install_fixup, python3-gw4xxx-sdhealth,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-sdhealth,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-sdhealth,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-sdhealth,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-sdhealth, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw4xxx-sdhealth)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-sdhealth.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_SDHEALTH)

# vim: syntax=make
