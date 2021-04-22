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
PACKAGES-$(PTXCONF_PYTHON3_PACKAGING) += python3-packaging

#
# Paths and names
#
PYTHON3_PACKAGING_VERSION	:= 20.4
PYTHON3_PACKAGING_MD5	:= 3208229da731c5d8e29d4d8941e75005
PYTHON3_PACKAGING		:= packaging-$(PYTHON3_PACKAGING_VERSION)
PYTHON3_PACKAGING_SUFFIX	:= tar.gz
PYTHON3_PACKAGING_URL	:= https://files.pythonhosted.org/packages/55/fd/fc1aca9cf51ed2f2c11748fa797370027babd82f87829c7a8e6dbe720145/$(PYTHON3_PACKAGING).$(PYTHON3_PACKAGING_SUFFIX)
PYTHON3_PACKAGING_SOURCE	:= $(SRCDIR)/$(PYTHON3_PACKAGING).$(PYTHON3_PACKAGING_SUFFIX)
PYTHON3_PACKAGING_DIR	:= $(BUILDDIR)/$(PYTHON3_PACKAGING)
PYTHON3_PACKAGING_LICENSE	:= Apache
PYTHON3_PACKAGING_LICENSE_FILES := \
	file://LICENSE;md5=faadaedca9251a90b205c9167578ce91


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PACKAGING_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-packaging.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PACKAGING)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PACKAGING_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-packaging.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-packaging)
	@$(call install_fixup, python3-packaging, PRIORITY, optional)
	@$(call install_fixup, python3-packaging, SECTION, base)
	@$(call install_fixup, python3-packaging, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-packaging, DESCRIPTION, missing)

		@$(call install_glob, python3-packaging, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/packaging,,  *.py)

	@$(call install_finish, python3-packaging)

	@$(call touch)

# vim: syntax=make
