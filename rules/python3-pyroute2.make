# -*-makefile-*-
#
# Copyright (C) 2020 by Niklas Sill <sill@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_PYROUTE2) += python3-pyroute2

#
# Paths and names
#
PYTHON3_PYROUTE2_VERSION	:= 0.5.14
PYTHON3_PYROUTE2_MD5	:= 6bde3624a6f22bdfb630bb54243a0d1d
PYTHON3_PYROUTE2		:= pyroute2-$(PYTHON3_PYROUTE2_VERSION)
PYTHON3_PYROUTE2_SUFFIX	:= tar.gz
PYTHON3_PYROUTE2_URL	:= https://files.pythonhosted.org/packages/0b/71/2920f854ef3cbb8472aa70539cf63fcc214e5c1b40f21c7cdb4910a6f5e9/$(PYTHON3_PYROUTE2).$(PYTHON3_PYROUTE2_SUFFIX)
PYTHON3_PYROUTE2_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYROUTE2).$(PYTHON3_PYROUTE2_SUFFIX)
PYTHON3_PYROUTE2_DIR	:= $(BUILDDIR)/$(PYTHON3_PYROUTE2)
PYTHON3_PYROUTE2_LICENSE	:= BSD
#PYTHON3_PYROUTE2_LICENSE_FILES := \
#	file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYROUTE2_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyroute2.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYROUTE2)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYROUTE2_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyroute2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyroute2)
	@$(call install_fixup, python3-pyroute2, PRIORITY, optional)
	@$(call install_fixup, python3-pyroute2, SECTION, base)
	@$(call install_fixup, python3-pyroute2, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pyroute2, DESCRIPTION, missing)

		@$(call install_glob, python3-pyroute2, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pyroute2,,  *.py)

	@$(call install_finish, python3-pyroute2)

	@$(call touch)

# vim: syntax=make
