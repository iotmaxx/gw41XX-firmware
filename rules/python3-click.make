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
PACKAGES-$(PTXCONF_PYTHON3_CLICK) += python3-click

#
# Paths and names
#
PYTHON3_CLICK_VERSION	:= 8.1.7
PYTHON3_CLICK_MD5	:= 7c3b52c56fd30699f453a7dc7b42cecb
PYTHON3_CLICK		:= click-$(PYTHON3_CLICK_VERSION)
PYTHON3_CLICK_SUFFIX	:= tar.gz
PYTHON3_CLICK_URL	:= $(call ptx/mirror-pypi, click, $(PYTHON3_CLICK).$(PYTHON3_CLICK_SUFFIX))
PYTHON3_CLICK_SOURCE	:= $(SRCDIR)/$(PYTHON3_CLICK).$(PYTHON3_CLICK_SUFFIX)
PYTHON3_CLICK_DIR	:= $(BUILDDIR)/$(PYTHON3_CLICK)
PYTHON3_CLICK_LICENSE	:= BSD-3
PYTHON3_CLICK_LICENSE_FILES := \
	file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CLICK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-click.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_CLICK)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_CLICK_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-click.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-click)
	@$(call install_fixup, python3-click, PRIORITY, optional)
	@$(call install_fixup, python3-click, SECTION, base)
	@$(call install_fixup, python3-click, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-click, DESCRIPTION, missing)

		@$(call install_glob, python3-click, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/click,,  *.py)

	@$(call install_finish, python3-click)

	@$(call touch)

# vim: syntax=make
