# -*-makefile-*-
#
# Copyright (C) 2021 by Niklas Sill <sill@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_MARKUPSAFE) += python3-markupsafe

#
# Paths and names
#
PYTHON3_MARKUPSAFE_VERSION	:= 1.1.1
PYTHON3_MARKUPSAFE_MD5	:= 43fd756864fe42063068e092e220c57b
PYTHON3_MARKUPSAFE		:= MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION)
PYTHON3_MARKUPSAFE_SUFFIX	:= tar.gz
PYTHON3_MARKUPSAFE_URL	:= https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/$(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX)
PYTHON3_MARKUPSAFE_SOURCE	:= $(SRCDIR)/$(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX)
PYTHON3_MARKUPSAFE_DIR	:= $(BUILDDIR)/$(PYTHON3_MARKUPSAFE)
PYTHON3_MARKUPSAFE_LICENSE	:= BSD-3
PYTHON3_MARKUPSAFE_LICENSE_FILES := \
	file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MARKUPSAFE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-markupsafe.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_MARKUPSAFE)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_MARKUPSAFE_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-markupsafe.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-markupsafe)
	@$(call install_fixup, python3-markupsafe, PRIORITY, optional)
	@$(call install_fixup, python3-markupsafe, SECTION, base)
	@$(call install_fixup, python3-markupsafe, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-markupsafe, DESCRIPTION, missing)

		@$(call install_glob, python3-markupsafe, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/markupsafe,,  *.py)

	@$(call install_finish, python3-markupsafe)

	@$(call touch)

# vim: syntax=make
