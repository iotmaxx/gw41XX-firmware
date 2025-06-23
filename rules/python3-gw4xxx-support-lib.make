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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_SUPPORT_LIB) += python3-gw4xxx-support-lib

#
# Paths and names
#
PYTHON3_GW4XXX_SUPPORT_LIB_VERSION	:= 0.1.2
PYTHON3_GW4XXX_SUPPORT_LIB_MD5		:= 520b56bfef78df385c9ce86715752257
PYTHON3_GW4XXX_SUPPORT_LIB		:= gw4xxx-support-lib-$(PYTHON3_GW4XXX_SUPPORT_LIB_VERSION)
PYTHON3_GW4XXX_SUPPORT_LIB_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_SUPPORT_LIB_URL		:= https://api.github.com/repos/iotmaxx/gw4xxx-support-lib/tarball/$(PYTHON3_GW4XXX_SUPPORT_LIB_VERSION)
PYTHON3_GW4XXX_SUPPORT_LIB_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_SUPPORT_LIB).$(PYTHON3_GW4XXX_SUPPORT_LIB_SUFFIX)
PYTHON3_GW4XXX_SUPPORT_LIB_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_SUPPORT_LIB)
PYTHON3_GW4XXX_SUPPORT_LIB_LICENSE	:= unknown
PYTHON3_GW4XXX_SUPPORT_LIB_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(PYTHON3_GW4XXX_SUPPORT_LIB_SOURCE):
	@$(call targetinfo)
	$(call gh_token_get, PYTHON3_GW4XXX_SUPPORT_LIB)
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_SUPPORT_LIB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_SUPPORT_LIB_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_SUPPORT_LIB_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_SUPPORT_LIB_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-support-lib.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_SUPPORT_LIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-support-lib.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_SUPPORT_LIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-support-lib.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_SUPPORT_LIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-support-lib.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-support-lib)
	@$(call install_fixup, python3-gw4xxx-support-lib,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-support-lib,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-support-lib,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-support-lib,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-support-lib, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw4xxx-support-lib)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-support-lib.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_SUPPORT_LIB)

# vim: syntax=make
