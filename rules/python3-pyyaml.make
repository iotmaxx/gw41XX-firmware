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
PACKAGES-$(PTXCONF_PYTHON3_PYYAML) += python3-pyyaml

#
# Paths and names
#
PYTHON3_PYYAML_VERSION	:= 5.3.1
PYTHON3_PYYAML_MD5	:= d3590b85917362e837298e733321962b
PYTHON3_PYYAML		:= PyYAML-$(PYTHON3_PYYAML_VERSION)
PYTHON3_PYYAML_SUFFIX	:= tar.gz
PYTHON3_PYYAML_URL	:= https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/$(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX)
PYTHON3_PYYAML_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX)
PYTHON3_PYYAML_DIR	:= $(BUILDDIR)/$(PYTHON3_PYYAML)
PYTHON3_PYYAML_LICENSE	:= Apache
PYTHON3_PYYAML_LICENSE_FILES := \
	file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYYAML_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyyaml.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYYAML)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYYAML_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyyaml.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyyaml)
	@$(call install_fixup, python3-pyyaml, PRIORITY, optional)
	@$(call install_fixup, python3-pyyaml, SECTION, base)
	@$(call install_fixup, python3-pyyaml, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pyyaml, DESCRIPTION, missing)

		@$(call install_glob, python3-pyyaml, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-pyyaml)

	@$(call touch)

# vim: syntax=make
