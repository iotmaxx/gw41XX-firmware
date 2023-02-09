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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_HAL) += python3-gw4xxx-hal

#
# Paths and names
#
PYTHON3_GW4XXX_HAL_VERSION	:= 0.3.10
PYTHON3_GW4XXX_HAL_MD5		:= 41248414c0d49deb21657a58d13c9c6c
PYTHON3_GW4XXX_HAL		:= python3-gw4xxx-hal-$(PYTHON3_GW4XXX_HAL_VERSION)
PYTHON3_GW4XXX_HAL_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_HAL_URL		:= https://github.com/iotmaxx/gw4xxx-hal/archive/$(PYTHON3_GW4XXX_HAL_VERSION)/$(PYTHON3_GW4XXX_HAL).$(PYTHON3_GW4XXX_HAL_SUFFIX)
PYTHON3_GW4XXX_HAL_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_HAL).$(PYTHON3_GW4XXX_HAL_SUFFIX)
PYTHON3_GW4XXX_HAL_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_HAL)
PYTHON3_GW4XXX_HAL_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW4XXX_HAL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_HAL_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_HAL)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_HAL_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_HAL_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_HAL_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-hal.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_HAL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-hal.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_HAL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-hal.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_HAL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-hal.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-hal)
	@$(call install_fixup, python3-gw4xxx-hal,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-hal,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-hal,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-hal,DESCRIPTION,missing)

#	@$(call install_glob, python3-gw4xxx-hal, 0, 0, -, $(PYTHON3_SITEPACKAGES)/gw4xxx-hal,, *.pyc)
	@$(call install_glob, python3-gw4xxx-hal, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py */tests)

#	@$(call install_copy, python3-gw4xxx-hal, 0, 0, 0755, $(PYTHON3_GW4XXX_HAL_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-gw4xxx-hal)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-hal.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_HAL)

# vim: syntax=make
