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
PACKAGES-$(PTXCONF_PYTHON3_CRYPTOGRAPHY) += python3-cryptography

#
# Paths and names
#
PYTHON3_CRYPTOGRAPHY_VERSION	:= 3.3.2
PYTHON3_CRYPTOGRAPHY_MD5	:= e2ce2ec8a63965fad351f36ed70fde4b
PYTHON3_CRYPTOGRAPHY		:= cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION)
PYTHON3_CRYPTOGRAPHY_SUFFIX	:= tar.gz
PYTHON3_CRYPTOGRAPHY_URL	:= $(call ptx/mirror-pypi, cryptography, $(PYTHON3_CRYPTOGRAPHY).$(PYTHON3_CRYPTOGRAPHY_SUFFIX))
PYTHON3_CRYPTOGRAPHY_SOURCE	:= $(SRCDIR)/$(PYTHON3_CRYPTOGRAPHY).$(PYTHON3_CRYPTOGRAPHY_SUFFIX)
PYTHON3_CRYPTOGRAPHY_DIR	:= $(BUILDDIR)/$(PYTHON3_CRYPTOGRAPHY)
PYTHON3_CRYPTOGRAPHY_LICENSE	:= Apache-2.0
PYTHON3_CRYPTOGRAPHY_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CRYPTOGRAPHY_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CRYPTOGRAPHY)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CRYPTOGRAPHY_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CRYPTOGRAPHY_CONF_TOOL	:= python3
#PYTHON3_CRYPTOGRAPHY_CONF_OPT	:= 

#$(STATEDIR)/python3-cryptography.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CRYPTOGRAPHY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-cryptography.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CRYPTOGRAPHY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-cryptography.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CRYPTOGRAPHY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-cryptography.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-cryptography)
	@$(call install_fixup, python3-cryptography,PRIORITY,optional)
	@$(call install_fixup, python3-cryptography,SECTION,base)
	@$(call install_fixup, python3-cryptography,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-cryptography,DESCRIPTION,missing)

	#@$(call install_copy, python3-cryptography, 0, 0, 0755, $(PYTHON3_CRYPTOGRAPHY_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-cryptography, 0, 0, -, $(PYTHON3_SITEPACKAGES)/cryptography,, *.pyc)
	@$(call install_finish, python3-cryptography)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-cryptography.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CRYPTOGRAPHY)

# vim: syntax=make
