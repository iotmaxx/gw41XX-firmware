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
PACKAGES-$(PTXCONF_PYTHON3_FROZENDICT) += python3-frozendict

#
# Paths and names
#
PYTHON3_FROZENDICT_VERSION	:= 2.4.6
PYTHON3_FROZENDICT_MD5		:= 2b9a6bfdfa4de419e1f32dae6b51e54a
PYTHON3_FROZENDICT		:= frozendict-$(PYTHON3_FROZENDICT_VERSION)
PYTHON3_FROZENDICT_SUFFIX	:= tar.gz
PYTHON3_FROZENDICT_URL		:= $(call ptx/mirror-pypi, frozendict, $(PYTHON3_FROZENDICT).$(PYTHON3_FROZENDICT_SUFFIX))
PYTHON3_FROZENDICT_SOURCE	:= $(SRCDIR)/$(PYTHON3_FROZENDICT).$(PYTHON3_FROZENDICT_SUFFIX)
PYTHON3_FROZENDICT_DIR		:= $(BUILDDIR)/$(PYTHON3_FROZENDICT)
PYTHON3_FROZENDICT_LICENSE	:= LGPL-3.0-or-later
PYTHON3_FROZENDICT_LICENSE_FILES	:= file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_FROZENDICT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_FROZENDICT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_FROZENDICT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_FROZENDICT_CONF_TOOL	:= python3
#PYTHON3_FROZENDICT_CONF_OPT	:= 

#$(STATEDIR)/python3-frozendict.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_FROZENDICT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-frozendict.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_FROZENDICT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-frozendict.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_FROZENDICT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-frozendict.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-frozendict)
	@$(call install_fixup, python3-frozendict,PRIORITY,optional)
	@$(call install_fixup, python3-frozendict,SECTION,base)
	@$(call install_fixup, python3-frozendict,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-frozendict,DESCRIPTION,missing)

	@$(call install_glob, python3-frozendict, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-frozendict)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-frozendict.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_FROZENDICT)

# vim: syntax=make
