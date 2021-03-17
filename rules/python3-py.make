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
PACKAGES-$(PTXCONF_PYTHON3_PY) += python3-py

#
# Paths and names
#
PYTHON3_PY_VERSION	:= 1.9.0
PYTHON3_PY_MD5	:= b80db4e61eef724f49feb4d20b649e62
PYTHON3_PY		:= py-$(PYTHON3_PY_VERSION)
PYTHON3_PY_SUFFIX	:= tar.gz
PYTHON3_PY_URL	:= https://files.pythonhosted.org/packages/97/a6/ab9183fe08f69a53d06ac0ee8432bc0ffbb3989c575cc69b73a0229a9a99/$(PYTHON3_PY).$(PYTHON3_PY_SUFFIX)
PYTHON3_PY_SOURCE	:= $(SRCDIR)/$(PYTHON3_PY).$(PYTHON3_PY_SUFFIX)
PYTHON3_PY_DIR	:= $(BUILDDIR)/$(PYTHON3_PY)
PYTHON3_PY_LICENSE	:= Apache
PYTHON3_PY_LICENSE_FILES := \
	file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PY_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-py.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PY)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PY_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-py.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-py)
	@$(call install_fixup, python3-py, PRIORITY, optional)
	@$(call install_fixup, python3-py, SECTION, base)
	@$(call install_fixup, python3-py, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-py, DESCRIPTION, missing)

		@$(call install_glob, python3-py, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/py,,  *.py)

	@$(call install_finish, python3-py)

	@$(call touch)

# vim: syntax=make
