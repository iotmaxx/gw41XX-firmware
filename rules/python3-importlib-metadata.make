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
PYTHON3_IMPORTLIB_METADATA_VERSION	:= 1.7.0
PYTHON3_IMPORTLIB_METADATA_MD5	:= 4505ea85600cca1e693a4f8f5dd27ba8
PYTHON3_IMPORTLIB_METADATA		:= importlib_metadata-$(PYTHON3_IMPORTLIB_METADATA_VERSION)
PYTHON3_IMPORTLIB_METADATA_SUFFIX	:= tar.gz
PYTHON3_IMPORTLIB_METADATA_URL	:= https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/$(PYTHON3_IMPORTLIB_METADATA).$(PYTHON3_IMPORTLIB_METADATA_SUFFIX)
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
