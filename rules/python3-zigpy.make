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
PACKAGES-$(PTXCONF_PYTHON3_ZIGPY) += python3-zigpy

#
# Paths and names
#
PYTHON3_ZIGPY_VERSION	:= 0.80.1
PYTHON3_ZIGPY_MD5	:= ccff77f49ce700d98c19609413efbf39
PYTHON3_ZIGPY		:= zigpy-$(PYTHON3_ZIGPY_VERSION)
PYTHON3_ZIGPY_SUFFIX	:= tar.gz
PYTHON3_ZIGPY_URL	:= $(call ptx/mirror-pypi, zigpy, $(PYTHON3_ZIGPY).$(PYTHON3_ZIGPY_SUFFIX))
PYTHON3_ZIGPY_SOURCE	:= $(SRCDIR)/$(PYTHON3_ZIGPY).$(PYTHON3_ZIGPY_SUFFIX)
PYTHON3_ZIGPY_DIR	:= $(BUILDDIR)/$(PYTHON3_ZIGPY)
PYTHON3_ZIGPY_LICENSE	:= GPL-3.0-only
PYTHON3_ZIGPY_LICENSE_FILES	:= file://LICENSE;md5=d32239bcb673463ab874e80d47fae504

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_ZIGPY_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_ZIGPY)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_ZIGPY_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_ZIGPY_CONF_TOOL	:= python3
#PYTHON3_ZIGPY_CONF_OPT	:= 

#$(STATEDIR)/python3-zigpy.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_ZIGPY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-zigpy.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_ZIGPY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-zigpy.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_ZIGPY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-zigpy.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-zigpy)
	@$(call install_fixup, python3-zigpy,PRIORITY,optional)
	@$(call install_fixup, python3-zigpy,SECTION,base)
	@$(call install_fixup, python3-zigpy,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-zigpy,DESCRIPTION,missing)

	@$(call install_glob, python3-zigpy, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-zigpy)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-zigpy.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_ZIGPY)

# vim: syntax=make
