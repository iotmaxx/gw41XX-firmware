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
PACKAGES-$(PTXCONF_PYTHON3_UMODBUS) += python3-umodbus

#
# Paths and names
#
PYTHON3_UMODBUS_VERSION	:= 1.0.4
PYTHON3_UMODBUS_MD5	:= 96d1742479fcbfb12e51eb0161b2ae95
PYTHON3_UMODBUS		:= uModbus-$(PYTHON3_UMODBUS_VERSION)
PYTHON3_UMODBUS_SUFFIX	:= tar.gz
PYTHON3_UMODBUS_URL	:= $(call ptx/mirror-pypi, umodbus, $(PYTHON3_UMODBUS).$(PYTHON3_UMODBUS_SUFFIX))
PYTHON3_UMODBUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_UMODBUS).$(PYTHON3_UMODBUS_SUFFIX)
PYTHON3_UMODBUS_DIR	:= $(BUILDDIR)/$(PYTHON3_UMODBUS)
PYTHON3_UMODBUS_LICENSE	:= MPL-2.0
PYTHON3_UMODBUS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_UMODBUS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_UMODBUS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_UMODBUS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_UMODBUS_CONF_TOOL	:= python3
#PYTHON3_UMODBUS_CONF_OPT	:= 

#$(STATEDIR)/python3-umodbus.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_UMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-umodbus.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_UMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-umodbus.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_UMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-umodbus.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-umodbus)
	@$(call install_fixup, python3-umodbus,PRIORITY,optional)
	@$(call install_fixup, python3-umodbus,SECTION,base)
	@$(call install_fixup, python3-umodbus,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-umodbus,DESCRIPTION,missing)

	@$(call install_glob, python3-umodbus, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)
#	@$(call install_copy, python3-umodbus, 0, 0, 0755, $(PYTHON3_UMODBUS_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-umodbus)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-umodbus.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_UMODBUS)

# vim: syntax=make
