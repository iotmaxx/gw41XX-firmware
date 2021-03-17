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
PACKAGES-$(PTXCONF_PYTHON3_ITSDANGEROUS) += python3-itsdangerous

#
# Paths and names
#
PYTHON3_ITSDANGEROUS_VERSION	:= 1.1.0
PYTHON3_ITSDANGEROUS_MD5	:= 9b7f5afa7f1e3acfb7786eeca3d99307
PYTHON3_ITSDANGEROUS		:= itsdangerous-$(PYTHON3_ITSDANGEROUS_VERSION)
PYTHON3_ITSDANGEROUS_SUFFIX	:= tar.gz
PYTHON3_ITSDANGEROUS_URL	:= https://files.pythonhosted.org/packages/68/1a/f27de07a8a304ad5fa817bbe383d1238ac4396da447fa11ed937039fa04b/$(PYTHON3_ITSDANGEROUS).$(PYTHON3_ITSDANGEROUS_SUFFIX)
PYTHON3_ITSDANGEROUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_ITSDANGEROUS).$(PYTHON3_ITSDANGEROUS_SUFFIX)
PYTHON3_ITSDANGEROUS_DIR	:= $(BUILDDIR)/$(PYTHON3_ITSDANGEROUS)
PYTHON3_ITSDANGEROUS_LICENSE	:= MIT
PYTHON3_ITSDANGEROUS_LICENSE_FILES := \
	file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ITSDANGEROUS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-itsdangerous.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_ITSDANGEROUS)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_ITSDANGEROUS_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-itsdangerous.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-itsdangerous)
	@$(call install_fixup, python3-itsdangerous, PRIORITY, optional)
	@$(call install_fixup, python3-itsdangerous, SECTION, base)
	@$(call install_fixup, python3-itsdangerous, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-itsdangerous, DESCRIPTION, missing)

		@$(call install_glob, python3-itsdangerous, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/itsdangerous,,  *.py)

	@$(call install_finish, python3-itsdangerous)

	@$(call touch)

# vim: syntax=make
