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
PACKAGES-$(PTXCONF_PYTHON3_PYPARSING) += python3-pyparsing

#
# Paths and names
#
PYTHON3_PYPARSING_VERSION	:= 2.4.7
PYTHON3_PYPARSING_MD5	:= f0953e47a0112f7a65aec2305ffdf7b4
PYTHON3_PYPARSING		:= pyparsing-$(PYTHON3_PYPARSING_VERSION)
PYTHON3_PYPARSING_SUFFIX	:= tar.gz
PYTHON3_PYPARSING_URL	:= https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/$(PYTHON3_PYPARSING).$(PYTHON3_PYPARSING_SUFFIX)
PYTHON3_PYPARSING_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYPARSING).$(PYTHON3_PYPARSING_SUFFIX)
PYTHON3_PYPARSING_DIR	:= $(BUILDDIR)/$(PYTHON3_PYPARSING)
PYTHON3_PYPARSING_LICENSE	:= Apache
PYTHON3_PYPARSING_LICENSE_FILES := \
	file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYPARSING_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyparsing.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYPARSING)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYPARSING_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyparsing.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyparsing)
	@$(call install_fixup, python3-pyparsing, PRIORITY, optional)
	@$(call install_fixup, python3-pyparsing, SECTION, base)
	@$(call install_fixup, python3-pyparsing, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pyparsing, DESCRIPTION, missing)

		@$(call install_glob, python3-pyparsing, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-pyparsing)

	@$(call touch)

# vim: syntax=make
