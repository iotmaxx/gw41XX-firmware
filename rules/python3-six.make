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
PACKAGES-$(PTXCONF_PYTHON3_SIX) += python3-six

#
# Paths and names
#
PYTHON3_SIX_VERSION	:= 1.15.0
PYTHON3_SIX_MD5	:= 9f90a0eaa0ea7747fda01ca79d21ebcb
PYTHON3_SIX		:= six-$(PYTHON3_SIX_VERSION)
PYTHON3_SIX_SUFFIX	:= tar.gz
PYTHON3_SIX_URL	:= https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/$(PYTHON3_SIX).$(PYTHON3_SIX_SUFFIX)
PYTHON3_SIX_SOURCE	:= $(SRCDIR)/$(PYTHON3_SIX).$(PYTHON3_SIX_SUFFIX)
PYTHON3_SIX_DIR	:= $(BUILDDIR)/$(PYTHON3_SIX)
PYTHON3_SIX_LICENSE	:= Apache
PYTHON3_SIX_LICENSE_FILES := \
	file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SIX_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-six.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_SIX)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_SIX_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-six.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-six)
	@$(call install_fixup, python3-six, PRIORITY, optional)
	@$(call install_fixup, python3-six, SECTION, base)
	@$(call install_fixup, python3-six, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-six, DESCRIPTION, missing)

		@$(call install_glob, python3-six, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-six)

	@$(call touch)

# vim: syntax=make
