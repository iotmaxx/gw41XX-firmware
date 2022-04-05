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
PACKAGES-$(PTXCONF_PYTHON3_PYCRYPTODOMEX) += python3-pycryptodomex

#
# Paths and names
#
PYTHON3_PYCRYPTODOMEX_VERSION	:= 3.14.1
PYTHON3_PYCRYPTODOMEX_MD5	:= 55f8c1121335891c7e972b73c15369ac
PYTHON3_PYCRYPTODOMEX		:= pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION)
PYTHON3_PYCRYPTODOMEX_SUFFIX	:= tar.gz
PYTHON3_PYCRYPTODOMEX_URL	:= $(call ptx/mirror-pypi, pycryptodomex, $(PYTHON3_PYCRYPTODOMEX).$(PYTHON3_PYCRYPTODOMEX_SUFFIX))
PYTHON3_PYCRYPTODOMEX_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYCRYPTODOMEX).$(PYTHON3_PYCRYPTODOMEX_SUFFIX)
PYTHON3_PYCRYPTODOMEX_DIR	:= $(BUILDDIR)/$(PYTHON3_PYCRYPTODOMEX)
PYTHON3_PYCRYPTODOMEX_LICENSE	:= BSD-2-Clause Unlicense
PYTHON3_PYCRYPTODOMEX_LICENSE_FILES	:= 

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PYCRYPTODOMEX_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PYCRYPTODOMEX)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PYCRYPTODOMEX_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PYCRYPTODOMEX_CONF_TOOL	:= python3
#PYTHON3_PYCRYPTODOMEX_CONF_OPT	:= 

#$(STATEDIR)/python3-pycryptodomex.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PYCRYPTODOMEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodomex.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PYCRYPTODOMEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodomex.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PYCRYPTODOMEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pycryptodomex.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pycryptodomex)
	@$(call install_fixup, python3-pycryptodomex,PRIORITY,optional)
	@$(call install_fixup, python3-pycryptodomex,SECTION,base)
	@$(call install_fixup, python3-pycryptodomex,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-pycryptodomex,DESCRIPTION,missing)

#	@$(call install_copy, python3-pycryptodomex, 0, 0, 0755, $(PYTHON3_PYCRYPTODOMEX_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-pycryptodomex, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pycryptodomex)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodomex.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PYCRYPTODOMEX)

# vim: syntax=make
