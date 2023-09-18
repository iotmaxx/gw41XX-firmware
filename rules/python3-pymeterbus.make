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
PACKAGES-$(PTXCONF_PYTHON3_PYMETERBUS) += python3-pymeterbus

#
# Paths and names
#
PYTHON3_PYMETERBUS_VERSION	:= 0.8.3
PYTHON3_PYMETERBUS_MD5		:= b95c6f70c616e2519d66bb3c7bd43035
PYTHON3_PYMETERBUS		:= pyMeterBus-$(PYTHON3_PYMETERBUS_VERSION)
PYTHON3_PYMETERBUS_SUFFIX	:= tar.gz
PYTHON3_PYMETERBUS_URL		:= https://github.com/ganehag/pyMeterBus/archive/refs/tags/v$(PYTHON3_PYMETERBUS_VERSION).$(PYTHON3_PYMETERBUS_SUFFIX)
PYTHON3_PYMETERBUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYMETERBUS).$(PYTHON3_PYMETERBUS_SUFFIX)
PYTHON3_PYMETERBUS_DIR		:= $(BUILDDIR)/$(PYTHON3_PYMETERBUS)
PYTHON3_PYMETERBUS_LICENSE	:= BSD-3-Clause
PYTHON3_PYMETERBUS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PYMETERBUS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PYMETERBUS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PYMETERBUS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PYMETERBUS_CONF_TOOL	:= python3
#PYTHON3_PYMETERBUS_CONF_OPT	:= 

#$(STATEDIR)/python3-pymeterbus.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PYMETERBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymeterbus.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PYMETERBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymeterbus.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PYMETERBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pymeterbus.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pymeterbus)
	@$(call install_fixup, python3-pymeterbus,PRIORITY,optional)
	@$(call install_fixup, python3-pymeterbus,SECTION,base)
	@$(call install_fixup, python3-pymeterbus,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-pymeterbus,DESCRIPTION,missing)

	@$(call install_glob, python3-pymeterbus, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)
#	@$(call install_copy, python3-pymeterbus, 0, 0, 0755, $(PYTHON3_PYMETERBUS_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-pymeterbus)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymeterbus.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PYMETERBUS)

# vim: syntax=make
