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
PACKAGES-$(PTXCONF_PYTHON3_PYCRYPTODOME) += python3-pycryptodome

#
# Paths and names
#
PYTHON3_PYCRYPTODOME_VERSION	:= 3.18.0
PYTHON3_PYCRYPTODOME_MD5	:= 500651c3e5f6bc456f2a0c366318f21b
PYTHON3_PYCRYPTODOME		:= pycryptodome-$(PYTHON3_PYCRYPTODOME_VERSION)
PYTHON3_PYCRYPTODOME_SUFFIX	:= tar.gz
PYTHON3_PYCRYPTODOME_URL	:= $(call ptx/mirror-pypi, pycryptodome, $(PYTHON3_PYCRYPTODOME).$(PYTHON3_PYCRYPTODOME_SUFFIX))
PYTHON3_PYCRYPTODOME_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYCRYPTODOME).$(PYTHON3_PYCRYPTODOME_SUFFIX)
PYTHON3_PYCRYPTODOME_DIR	:= $(BUILDDIR)/$(PYTHON3_PYCRYPTODOME)
PYTHON3_PYCRYPTODOME_LICENSE	:= BSD-2-Clause Unlicense
PYTHON3_PYCRYPTODOME_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PYCRYPTODOME_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PYCRYPTODOME)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PYCRYPTODOME_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PYCRYPTODOME_CONF_TOOL	:= python3
#PYTHON3_PYCRYPTODOME_CONF_OPT	:= 

#$(STATEDIR)/python3-pycryptodome.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PYCRYPTODOME)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodome.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PYCRYPTODOME)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodome.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PYCRYPTODOME)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pycryptodome.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pycryptodome)
	@$(call install_fixup, python3-pycryptodome,PRIORITY,optional)
	@$(call install_fixup, python3-pycryptodome,SECTION,base)
	@$(call install_fixup, python3-pycryptodome,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-pycryptodome,DESCRIPTION,missing)

#	@$(call install_copy, python3-pycryptodome, 0, 0, 0755, $(PYTHON3_PYCRYPTODOME_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-pycryptodome, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pycryptodome)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pycryptodome.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PYCRYPTODOME)

# vim: syntax=make
