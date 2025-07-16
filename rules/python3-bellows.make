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
PACKAGES-$(PTXCONF_PYTHON3_BELLOWS) += python3-bellows

#
# Paths and names
#
PYTHON3_BELLOWS_VERSION	:= 0.45.2
PYTHON3_BELLOWS_MD5	:= b30f69b44553a32ad0efab5ba24b63f3
PYTHON3_BELLOWS		:= bellows-$(PYTHON3_BELLOWS_VERSION)
PYTHON3_BELLOWS_SUFFIX	:= tar.gz
PYTHON3_BELLOWS_URL	:= $(call ptx/mirror-pypi, bellows, $(PYTHON3_BELLOWS).$(PYTHON3_BELLOWS_SUFFIX))
PYTHON3_BELLOWS_SOURCE	:= $(SRCDIR)/$(PYTHON3_BELLOWS).$(PYTHON3_BELLOWS_SUFFIX)
PYTHON3_BELLOWS_DIR	:= $(BUILDDIR)/$(PYTHON3_BELLOWS)
PYTHON3_BELLOWS_LICENSE	:= GPL-3.0-only
PYTHON3_BELLOWS_LICENSE_FILES	:= file://LICENSE;md5=d32239bcb673463ab874e80d47fae504

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_BELLOWS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_BELLOWS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_BELLOWS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_BELLOWS_CONF_TOOL	:= python3
#PYTHON3_BELLOWS_CONF_OPT	:= 

#$(STATEDIR)/python3-bellows.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_BELLOWS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-bellows.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_BELLOWS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-bellows.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_BELLOWS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-bellows.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-bellows)
	@$(call install_fixup, python3-bellows,PRIORITY,optional)
	@$(call install_fixup, python3-bellows,SECTION,base)
	@$(call install_fixup, python3-bellows,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-bellows,DESCRIPTION,missing)

	@$(call install_glob, python3-bellows, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-bellows)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-bellows.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_BELLOWS)

# vim: syntax=make
