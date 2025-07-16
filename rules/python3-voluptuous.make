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
PACKAGES-$(PTXCONF_PYTHON3_VOLUPTUOUS) += python3-voluptuous

#
# Paths and names
#
PYTHON3_VOLUPTUOUS_VERSION	:= 0.15.2
PYTHON3_VOLUPTUOUS_MD5		:= d963b2b4f3f2c6489e85f32605418964
PYTHON3_VOLUPTUOUS		:= voluptuous-$(PYTHON3_VOLUPTUOUS_VERSION)
PYTHON3_VOLUPTUOUS_SUFFIX	:= tar.gz
PYTHON3_VOLUPTUOUS_URL		:= $(call ptx/mirror-pypi, voluptuous, $(PYTHON3_VOLUPTUOUS).$(PYTHON3_VOLUPTUOUS_SUFFIX))
PYTHON3_VOLUPTUOUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_VOLUPTUOUS).$(PYTHON3_VOLUPTUOUS_SUFFIX)
PYTHON3_VOLUPTUOUS_DIR		:= $(BUILDDIR)/$(PYTHON3_VOLUPTUOUS)
PYTHON3_VOLUPTUOUS_LICENSE	:= BSD-3-Clause
PYTHON3_VOLUPTUOUS_LICENSE_FILES	:= file://COPYING;md5=9855ba150f2edb00d8e7a41554896ffb

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_VOLUPTUOUS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_VOLUPTUOUS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_VOLUPTUOUS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_VOLUPTUOUS_CONF_TOOL	:= python3
#PYTHON3_VOLUPTUOUS_CONF_OPT	:= 

#$(STATEDIR)/python3-voluptuous.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_VOLUPTUOUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-voluptuous.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_VOLUPTUOUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-voluptuous.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_VOLUPTUOUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-voluptuous.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-voluptuous)
	@$(call install_fixup, python3-voluptuous,PRIORITY,optional)
	@$(call install_fixup, python3-voluptuous,SECTION,base)
	@$(call install_fixup, python3-voluptuous,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-voluptuous,DESCRIPTION,missing)

	@$(call install_glob, python3-voluptuous, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-voluptuous)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-voluptuous.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_VOLUPTUOUS)

# vim: syntax=make
