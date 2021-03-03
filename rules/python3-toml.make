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
PACKAGES-$(PTXCONF_PYTHON3_TOML) += python3-toml

#
# Paths and names
#
PYTHON3_TOML_VERSION	:= 0.10.1
PYTHON3_TOML_MD5	:= 743131c431419fe42f854cff02ad3abe
PYTHON3_TOML		:= toml-$(PYTHON3_TOML_VERSION)
PYTHON3_TOML_SUFFIX	:= tar.gz
PYTHON3_TOML_URL	:= https://files.pythonhosted.org/packages/da/24/84d5c108e818ca294efe7c1ce237b42118643ce58a14d2462b3b2e3800d5/$(PYTHON3_TOML).$(PYTHON3_TOML_SUFFIX)
PYTHON3_TOML_SOURCE	:= $(SRCDIR)/$(PYTHON3_TOML).$(PYTHON3_TOML_SUFFIX)
PYTHON3_TOML_DIR	:= $(BUILDDIR)/$(PYTHON3_TOML)
PYTHON3_TOML_LICENSE	:= Apache
PYTHON3_TOML_LICENSE_FILES := \
	file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_TOML_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-toml.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_TOML)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_TOML_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-toml.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-toml)
	@$(call install_fixup, python3-toml, PRIORITY, optional)
	@$(call install_fixup, python3-toml, SECTION, base)
	@$(call install_fixup, python3-toml, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-toml, DESCRIPTION, missing)

		@$(call install_glob, python3-toml, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/toml,,  *.py)

	@$(call install_finish, python3-toml)

	@$(call touch)

# vim: syntax=make
