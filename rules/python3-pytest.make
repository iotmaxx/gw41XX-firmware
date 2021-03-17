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
PACKAGES-$(PTXCONF_PYTHON3_PYTEST) += python3-pytest

#
# Paths and names
#
PYTHON3_PYTEST_VERSION	:= 6.0.1
PYTHON3_PYTEST_MD5	:= c3e7c811b2b74c60bb5fb951229ebce9
PYTHON3_PYTEST		:= pytest-$(PYTHON3_PYTEST_VERSION)
PYTHON3_PYTEST_SUFFIX	:= tar.gz
PYTHON3_PYTEST_URL	:= https://files.pythonhosted.org/packages/20/4c/d7b19b8661be78461fff0392e33943784340424921578fe1bf300ef59831/$(PYTHON3_PYTEST).$(PYTHON3_PYTEST_SUFFIX)
PYTHON3_PYTEST_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYTEST).$(PYTHON3_PYTEST_SUFFIX)
PYTHON3_PYTEST_DIR	:= $(BUILDDIR)/$(PYTHON3_PYTEST)
PYTHON3_PYTEST_LICENSE	:= Apache
PYTHON3_PYTEST_LICENSE_FILES := \
	file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYTEST_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pytest.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYTEST)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYTEST_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pytest.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pytest)
	@$(call install_fixup, python3-pytest, PRIORITY, optional)
	@$(call install_fixup, python3-pytest, SECTION, base)
	@$(call install_fixup, python3-pytest, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pytest, DESCRIPTION, missing)

		@$(call install_glob, python3-pytest, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pytest,,  collection.py)
		@$(call install_glob, python3-pytest, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pytest,,  __init__.py)
		@$(call install_glob, python3-pytest, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pytest,,  __main__.py)
		@$(call install_glob, python3-pytest, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pytest,,  py.typed)
		@$(call install_glob, python3-pytest, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/_pytest,,  *.py)

	@$(call install_finish, python3-pytest)

	@$(call touch)

# vim: syntax=make
