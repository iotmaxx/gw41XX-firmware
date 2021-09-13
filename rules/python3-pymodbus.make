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
PACKAGES-$(PTXCONF_PYTHON3_PYMODBUS) += python3-pymodbus

#
# Paths and names
#
PYTHON3_PYMODBUS_VERSION	:= 2.5.2
PYTHON3_PYMODBUS_MD5		:= 88f4eebf1b14023578c43ee2c79b41f5
PYTHON3_PYMODBUS		:= pymodbus-$(PYTHON3_PYMODBUS_VERSION)
PYTHON3_PYMODBUS_SUFFIX		:= tar.gz
PYTHON3_PYMODBUS_URL		:= https://files.pythonhosted.org/packages/ce/9d/66623467a56f5929a76bcf8bdeac01237b3767c910c2eec8367d958b863e/$(PYTHON3_PYMODBUS).$(PYTHON3_PYMODBUS_SUFFIX)
PYTHON3_PYMODBUS_SOURCE		:= $(SRCDIR)/$(PYTHON3_PYMODBUS).$(PYTHON3_PYMODBUS_SUFFIX)
PYTHON3_PYMODBUS_DIR		:= $(BUILDDIR)/$(PYTHON3_PYMODBUS)
PYTHON3_PYMODBUS_LICENSE	:= BSD-3-Clause
PYTHON3_PYMODBUS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PYMODBUS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PYMODBUS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PYMODBUS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PYMODBUS_CONF_TOOL	:= python3
#PYTHON3_PYMODBUS_CONF_OPT	:= 

#$(STATEDIR)/python3-pymodbus.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PYMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymodbus.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PYMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymodbus.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PYMODBUS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pymodbus.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pymodbus)
	@$(call install_fixup, python3-pymodbus,PRIORITY,optional)
	@$(call install_fixup, python3-pymodbus,SECTION,base)
	@$(call install_fixup, python3-pymodbus,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-pymodbus,DESCRIPTION,missing)

#	@$(call install_copy, python3-pymodbus, 0, 0, 0755, $(PYTHON3_PYMODBUS_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-pymodbus, 0, 0, -, $(PYTHON3_SITEPACKAGES)/pymodbus,, *.pyc)

	@$(call install_finish, python3-pymodbus)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pymodbus.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PYMODBUS)

# vim: syntax=make
