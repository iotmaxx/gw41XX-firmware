# -*-makefile-*-
#
# Copyright (C) 2021 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_CRCCHECK) += python3-crccheck

#
# Paths and names
#
PYTHON3_CRCCHECK_VERSION	:= 1.0
PYTHON3_CRCCHECK_MD5		:= 09e321345ca70cfa2cfc9a72960d054f
PYTHON3_CRCCHECK		:= crccheck-$(PYTHON3_CRCCHECK_VERSION)
PYTHON3_CRCCHECK_SUFFIX		:= tar.gz
PYTHON3_CRCCHECK_URL		:= https://files.pythonhosted.org/packages/b0/40/21652b902a244a8516dc314e6e0053179164ca703628b53419a3b4ec063f/$(PYTHON3_CRCCHECK).$(PYTHON3_CRCCHECK_SUFFIX)
PYTHON3_CRCCHECK_SOURCE		:= $(SRCDIR)/$(PYTHON3_CRCCHECK).$(PYTHON3_CRCCHECK_SUFFIX)
PYTHON3_CRCCHECK_DIR		:= $(BUILDDIR)/$(PYTHON3_CRCCHECK)
PYTHON3_CRCCHECK_LICENSE	:= GPL-3.0-or-later
#PYTHON3_CRCCHECK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CRCCHECK_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CRCCHECK)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CRCCHECK_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CRCCHECK_CONF_TOOL	:= python3
#PYTHON3_CRCCHECK_CONF_OPT	:= 

#$(STATEDIR)/python3-crccheck.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CRCCHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-crccheck.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CRCCHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-crccheck.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CRCCHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-crccheck.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-crccheck)
	@$(call install_fixup, python3-crccheck,PRIORITY,optional)
	@$(call install_fixup, python3-crccheck,SECTION,base)
	@$(call install_fixup, python3-crccheck,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-crccheck,DESCRIPTION,missing)

#	@$(call install_copy, python3-crccheck, 0, 0, 0755, $(PYTHON3_CRCCHECK_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-crccheck, 0, 0, -, $(PYTHON3_SITEPACKAGES)/crccheck,, *.pyc)

	@$(call install_finish, python3-crccheck)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-crccheck.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CRCCHECK)

# vim: syntax=make
