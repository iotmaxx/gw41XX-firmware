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
PACKAGES-$(PTXCONF_PYTHON3_WRAPT) += python3-wrapt

#
# Paths and names
#
PYTHON3_WRAPT_VERSION	:= 1.12.1
PYTHON3_WRAPT_MD5	:= 6d56ed0de4336462a73350341462f45e
PYTHON3_WRAPT		:= wrapt-$(PYTHON3_WRAPT_VERSION)
PYTHON3_WRAPT_SUFFIX	:= tar.gz
PYTHON3_WRAPT_URL	:= https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797/$(PYTHON3_WRAPT).$(PYTHON3_WRAPT_SUFFIX)
PYTHON3_WRAPT_SOURCE	:= $(SRCDIR)/$(PYTHON3_WRAPT).$(PYTHON3_WRAPT_SUFFIX)
PYTHON3_WRAPT_DIR	:= $(BUILDDIR)/$(PYTHON3_WRAPT)
PYTHON3_WRAPT_LICENSE	:= BSD
#PYTHON3_WRAPT_LICENSE_FILES := \
#	file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WRAPT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-wrapt.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_WRAPT)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_WRAPT_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-wrapt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-wrapt)
	@$(call install_fixup, python3-wrapt, PRIORITY, optional)
	@$(call install_fixup, python3-wrapt, SECTION, base)
	@$(call install_fixup, python3-wrapt, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-wrapt, DESCRIPTION, missing)

		@$(call install_glob, python3-wrapt, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/wrapt,,  *.py)

	@$(call install_finish, python3-wrapt)

	@$(call touch)

# vim: syntax=make
