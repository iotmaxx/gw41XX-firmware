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
PACKAGES-$(PTXCONF_PYTHON3_PYTHON_DOTEV) += python3-python-dotenv

#
# Paths and names
#
PYTHON3_PYTHON_DOTEV_VERSION	:= 0.15.0
PYTHON3_PYTHON_DOTEV_MD5	:= 9d7088bfdb1edef7847c55915468dc28
PYTHON3_PYTHON_DOTEV		:= python-dotenv-$(PYTHON3_PYTHON_DOTEV_VERSION)
PYTHON3_PYTHON_DOTEV_SUFFIX	:= tar.gz
PYTHON3_PYTHON_DOTEV_URL	:= https://files.pythonhosted.org/packages/53/04/1a8126516c8febfeb2015844edee977c9b783bdff9b3bcd89b1cc2e1f372/$(PYTHON3_PYTHON_DOTEV).$(PYTHON3_PYTHON_DOTEV_SUFFIX)
PYTHON3_PYTHON_DOTEV_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYTHON_DOTEV).$(PYTHON3_PYTHON_DOTEV_SUFFIX)
PYTHON3_PYTHON_DOTEV_DIR	:= $(BUILDDIR)/$(PYTHON3_PYTHON_DOTEV)
PYTHON3_PYTHON_DOTEV_LICENSE	:= Apache


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYTHON_DOTEV_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-python-dotenv.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYTHON_DOTEV)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYTHON_DOTEV_DIR)/site.cfg
	@$(call touch)



# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-python-dotenv.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-python-dotenv)
	@$(call install_fixup, python3-python-dotenv, PRIORITY, optional)
	@$(call install_fixup, python3-python-dotenv, SECTION, base)
	@$(call install_fixup, python3-python-dotenv, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-python-dotenv, DESCRIPTION, missing)

		@$(call install_glob, python3-python-dotenv, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/dotenv,,  *.py)

	@$(call install_finish, python3-python-dotenv)

	@$(call touch)

# vim: syntax=make
