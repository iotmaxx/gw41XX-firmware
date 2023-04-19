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
PACKAGES-$(PTXCONF_PYTHON3_SMLLIB) += python3-smllib

#
# Paths and names
#
PYTHON3_SMLLIB_VERSION		:= 1.2
PYTHON3_SMLLIB_MD5		:= 6957323ee1cdbc44c5dc30956dcf4c09
PYTHON3_SMLLIB			:= smllib-$(PYTHON3_SMLLIB_VERSION)
PYTHON3_SMLLIB_SUFFIX		:= tar.gz
PYTHON3_SMLLIB_URL		:= $(call ptx/mirror-pypi, smllib, $(PYTHON3_SMLLIB).$(PYTHON3_SMLLIB_SUFFIX))
PYTHON3_SMLLIB_SOURCE		:= $(SRCDIR)/$(PYTHON3_SMLLIB).$(PYTHON3_SMLLIB_SUFFIX)
PYTHON3_SMLLIB_DIR		:= $(BUILDDIR)/$(PYTHON3_SMLLIB)
PYTHON3_SMLLIB_LICENSE		:= GPL-3.0-or-later
PYTHON3_SMLLIB_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_SMLLIB_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_SMLLIB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_SMLLIB_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_SMLLIB_CONF_TOOL	:= python3
#PYTHON3_SMLLIB_CONF_OPT	:= 

#$(STATEDIR)/python3-smllib.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_SMLLIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-smllib.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_SMLLIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-smllib.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_SMLLIB)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-smllib.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-smllib)
	@$(call install_fixup, python3-smllib,PRIORITY,optional)
	@$(call install_fixup, python3-smllib,SECTION,base)
	@$(call install_fixup, python3-smllib,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-smllib,DESCRIPTION,missing)

	@$(call install_glob, python3-smllib, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-smllib)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-smllib.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_SMLLIB)

# vim: syntax=make
