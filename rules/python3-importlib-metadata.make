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
PACKAGES-$(PTXCONF_PYTHON3_IMPORTLIB_METADATA) += python3-importlib-metadata

#
# Paths and names
#
PYTHON3_IMPORTLIB_METADATA_VERSION	:= 2.0.0
PYTHON3_IMPORTLIB_METADATA_MD5	:= 3dd91821c930a3c3633e99a7025aa9c2
PYTHON3_IMPORTLIB_METADATA		:= importlib_metadata-$(PYTHON3_IMPORTLIB_METADATA_VERSION)
PYTHON3_IMPORTLIB_METADATA_SUFFIX	:= tar.gz
PYTHON3_IMPORTLIB_METADATA_URL	:= https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/$(PYTHON3_IMPORTLIB_METADATA).$(PYTHON3_IMPORTLIB_METADATA_SUFFIX)
PYTHON3_IMPORTLIB_METADATA_SOURCE	:= $(SRCDIR)/$(PYTHON3_IMPORTLIB_METADATA).$(PYTHON3_IMPORTLIB_METADATA_SUFFIX)
PYTHON3_IMPORTLIB_METADATA_DIR	:= $(BUILDDIR)/$(PYTHON3_IMPORTLIB_METADATA)
PYTHON3_IMPORTLIB_METADATA_LICENSE	:= Apache
PYTHON3_IMPORTLIB_METADATA_LICENSE_FILES := \
	file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IMPORTLIB_METADATA_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-importlib-metadata.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_IMPORTLIB_METADATA)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_IMPORTLIB_METADATA_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-importlib-metadata.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-importlib-metadata)
	@$(call install_fixup, python3-importlib-metadata, PRIORITY, optional)
	@$(call install_fixup, python3-importlib-metadata, SECTION, base)
	@$(call install_fixup, python3-importlib-metadata, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-importlib-metadata, DESCRIPTION, missing)

		@$(call install_glob, python3-importlib-metadata, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/importlib_metadata,,  *.py)
		

		

	@$(call install_finish, python3-importlib-metadata)

	@$(call touch)

# vim: syntax=make
