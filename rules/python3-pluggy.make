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
PACKAGES-$(PTXCONF_PYTHON3_PLUGGY) += python3-pluggy

#
# Paths and names
#
PYTHON3_PLUGGY_VERSION	:= 0.13.1
PYTHON3_PLUGGY_MD5	:= 7f610e28b8b34487336b585a3dfb803d
PYTHON3_PLUGGY		:= pluggy-$(PYTHON3_PLUGGY_VERSION)
PYTHON3_PLUGGY_SUFFIX	:= tar.gz
PYTHON3_PLUGGY_URL	:= https://files.pythonhosted.org/packages/f8/04/7a8542bed4b16a65c2714bf76cf5a0b026157da7f75e87cc88774aa10b14/$(PYTHON3_PLUGGY).$(PYTHON3_PLUGGY_SUFFIX)
PYTHON3_PLUGGY_SOURCE	:= $(SRCDIR)/$(PYTHON3_PLUGGY).$(PYTHON3_PLUGGY_SUFFIX)
PYTHON3_PLUGGY_DIR	:= $(BUILDDIR)/$(PYTHON3_PLUGGY)
PYTHON3_PLUGGY_LICENSE	:= Apache
PYTHON3_PLUGGY_LICENSE_FILES := \
	file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PLUGGY_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pluggy.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PLUGGY)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PLUGGY_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pluggy.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pluggy)
	@$(call install_fixup, python3-pluggy, PRIORITY, optional)
	@$(call install_fixup, python3-pluggy, SECTION, base)
	@$(call install_fixup, python3-pluggy, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pluggy, DESCRIPTION, missing)

		@$(call install_glob, python3-pluggy, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pluggy,,  *.py)

	@$(call install_finish, python3-pluggy)

	@$(call touch)

# vim: syntax=make
