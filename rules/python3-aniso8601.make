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
PACKAGES-$(PTXCONF_PYTHON3_ANISO8601) += python3-aniso8601

#
# Paths and names
#
PYTHON3_ANISO8601_VERSION	:= 9.0.1
PYTHON3_ANISO8601_MD5		:= 89b25ea9fd70b8facaf189aed43afcf8
PYTHON3_ANISO8601		:= aniso8601-$(PYTHON3_ANISO8601_VERSION)
PYTHON3_ANISO8601_SUFFIX	:= tar.gz
PYTHON3_ANISO8601_URL		:= $(call ptx/mirror-pypi, aniso8601, $(PYTHON3_ANISO8601).$(PYTHON3_ANISO8601_SUFFIX))
PYTHON3_ANISO8601_SOURCE	:= $(SRCDIR)/$(PYTHON3_ANISO8601).$(PYTHON3_ANISO8601_SUFFIX)
PYTHON3_ANISO8601_DIR		:= $(BUILDDIR)/$(PYTHON3_ANISO8601)
PYTHON3_ANISO8601_LICENSE	:= BSD-3-Clause
PYTHON3_ANISO8601_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_ANISO8601_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_ANISO8601)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_ANISO8601_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_ANISO8601_CONF_TOOL	:= python3
#PYTHON3_ANISO8601_CONF_OPT	:= 

#$(STATEDIR)/python3-aniso8601.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_ANISO8601)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-aniso8601.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_ANISO8601)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-aniso8601.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_ANISO8601)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-aniso8601.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-aniso8601)
	@$(call install_fixup, python3-aniso8601,PRIORITY,optional)
	@$(call install_fixup, python3-aniso8601,SECTION,base)
	@$(call install_fixup, python3-aniso8601,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-aniso8601,DESCRIPTION,missing)

	#@$(call install_copy, python3-aniso8601, 0, 0, 0755, $(PYTHON3_ANISO8601_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-aniso8601, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)
	@$(call install_finish, python3-aniso8601)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-aniso8601.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_ANISO8601)

# vim: syntax=make
