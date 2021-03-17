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
PACKAGES-$(PTXCONF_PYTHON3_INICONFIG) += python3-iniconfig

#
# Paths and names
#
PYTHON3_INICONFIG_VERSION	:= 1.0.0
PYTHON3_INICONFIG_MD5	:= 1b540c1e0c5648773e0950cdf84834a8
PYTHON3_INICONFIG		:= iniconfig-$(PYTHON3_INICONFIG_VERSION)
PYTHON3_INICONFIG_SUFFIX	:= tar.gz
PYTHON3_INICONFIG_URL	:= https://files.pythonhosted.org/packages/9d/6f/7187ac1996add14e220e565cad9867eb0b90b5fda523357f5ba52ee16d31/$(PYTHON3_INICONFIG).$(PYTHON3_INICONFIG_SUFFIX)
PYTHON3_INICONFIG_SOURCE	:= $(SRCDIR)/$(PYTHON3_INICONFIG).$(PYTHON3_INICONFIG_SUFFIX)
PYTHON3_INICONFIG_DIR	:= $(BUILDDIR)/$(PYTHON3_INICONFIG)
PYTHON3_INICONFIG_LICENSE	:= Apache
PYTHON3_INICONFIG_LICENSE_FILES := \
	file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_INICONFIG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-iniconfig.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_INICONFIG)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_INICONFIG_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-iniconfig.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-iniconfig)
	@$(call install_fixup, python3-iniconfig, PRIORITY, optional)
	@$(call install_fixup, python3-iniconfig, SECTION, base)
	@$(call install_fixup, python3-iniconfig, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-iniconfig, DESCRIPTION, missing)

		@$(call install_glob, python3-iniconfig, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-iniconfig)

	@$(call touch)

# vim: syntax=make
