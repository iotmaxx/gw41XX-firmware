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
PACKAGES-$(PTXCONF_PYTHON3_PYJWT) += python3-pyjwt

#
# Paths and names
#
PYTHON3_PYJWT_VERSION	:= 1.7.1
PYTHON3_PYJWT_MD5	:= a4712f980c008696e13e09504120b2a0
PYTHON3_PYJWT		:= PyJWT-$(PYTHON3_PYJWT_VERSION)
PYTHON3_PYJWT_SUFFIX	:= tar.gz
PYTHON3_PYJWT_URL	:= https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c/$(PYTHON3_PYJWT).$(PYTHON3_PYJWT_SUFFIX)
PYTHON3_PYJWT_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYJWT).$(PYTHON3_PYJWT_SUFFIX)
PYTHON3_PYJWT_DIR	:= $(BUILDDIR)/$(PYTHON3_PYJWT)
PYTHON3_PYJWT_LICENSE	:= MIT
PYTHON3_PYJWT_LICENSE_FILES := \
	file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYJWT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyjwt.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYJWT)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYJWT_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyjwt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyjwt)
	@$(call install_fixup, python3-pyjwt, PRIORITY, optional)
	@$(call install_fixup, python3-pyjwt, SECTION, base)
	@$(call install_fixup, python3-pyjwt, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pyjwt, DESCRIPTION, missing)

		@$(call install_glob, python3-pyjwt, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/jwt,,  *.py)

	@$(call install_finish, python3-pyjwt)

	@$(call touch)

# vim: syntax=make
