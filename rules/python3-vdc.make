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
PACKAGES-$(PTXCONF_PYTHON3_VDC) += python3-vdc

#
# Paths and names
#
PYTHON3_VDC_VERSION	:= 0.1
PYTHON3_VDC_MD5		:= 6655d8e87f8653cf8851571e1bd435eb
PYTHON3_VDC		:= vdc-$(PYTHON3_VDC_VERSION)
PYTHON3_VDC_SUFFIX	:= zip
PYTHON3_VDC_URL		:= http://172.17.0.1:8080/vdc/$(PYTHON3_VDC).$(PYTHON3_VDC_SUFFIX)
PYTHON3_VDC_SOURCE	:= $(SRCDIR)/$(PYTHON3_VDC).$(PYTHON3_VDC_SUFFIX)
PYTHON3_VDC_DIR		:= $(BUILDDIR)/$(PYTHON3_VDC)
PYTHON3_VDC_LICENSE	:= unknown
PYTHON3_VDC_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_VDC_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_VDC)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_VDC_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_VDC_CONF_TOOL	:= python3
#PYTHON3_VDC_CONF_OPT	:= 

#$(STATEDIR)/python3-vdc.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_VDC)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-vdc.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_VDC)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-vdc.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_VDC)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-vdc.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-vdc)
	@$(call install_fixup, python3-vdc,PRIORITY,optional)
	@$(call install_fixup, python3-vdc,SECTION,base)
	@$(call install_fixup, python3-vdc,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-vdc,DESCRIPTION,missing)

	#@$(call install_copy, python3-vdc, 0, 0, 0755, $(PYTHON3_VDC_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-vdc, 0, 0, -, $(PYTHON3_SITEPACKAGES)/gate_gateway,, *.pyc)

	@$(call install_finish, python3-vdc)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-vdc.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_VDC)

# vim: syntax=make
