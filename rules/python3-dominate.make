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
PACKAGES-$(PTXCONF_PYTHON3_DOMINATE) += python3-dominate

#
# Paths and names
#
PYTHON3_DOMINATE_VERSION	:= 2.6.0
PYTHON3_DOMINATE_MD5		:= 9f714324ca99eee98bb3c3cdbe838de6
PYTHON3_DOMINATE		:= dominate-$(PYTHON3_DOMINATE_VERSION)
PYTHON3_DOMINATE_SUFFIX		:= tar.gz
PYTHON3_DOMINATE_URL		:= https://files.pythonhosted.org/packages/29/23/edf8e470f1053245c1aa99d92c8a3da9e83f6c7d3eb39205486965425be5/$(PYTHON3_DOMINATE).$(PYTHON3_DOMINATE_SUFFIX)
PYTHON3_DOMINATE_SOURCE		:= $(SRCDIR)/$(PYTHON3_DOMINATE).$(PYTHON3_DOMINATE_SUFFIX)
PYTHON3_DOMINATE_DIR		:= $(BUILDDIR)/$(PYTHON3_DOMINATE)
PYTHON3_DOMINATE_LICENSE	:= LGPL-3.0-only
PYTHON3_DOMINATE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_DOMINATE_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_DOMINATE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_DOMINATE_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_DOMINATE_CONF_TOOL	:= python3
#PYTHON3_DOMINATE_CONF_OPT	:= 

#$(STATEDIR)/python3-dominate.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_DOMINATE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-dominate.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_DOMINATE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-dominate.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_DOMINATE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-dominate.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-dominate)
	@$(call install_fixup, python3-dominate,PRIORITY,optional)
	@$(call install_fixup, python3-dominate,SECTION,base)
	@$(call install_fixup, python3-dominate,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-dominate,DESCRIPTION,missing)

#	@$(call install_copy, python3-dominate, 0, 0, 0755, $(PYTHON3_DOMINATE_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-dominate, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_finish, python3-dominate)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-dominate.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_DOMINATE)

# vim: syntax=make
