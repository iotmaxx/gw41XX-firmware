# -*-makefile-*-
#
# Copyright (C) 2021 by Niklas Sill <sill@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW_CLI) += python3-gw-cli

#
# Paths and names
#
PYTHON3_GW_CLI_VERSION	:= 0.2.1
PYTHON3_GW_CLI_MD5	:= 4c0c712714449f6dabf05fda9876ffce
PYTHON3_GW_CLI		:= gw-cli
PYTHON3_GW_CLI_SUFFIX	:= zip
PYTHON3_GW_CLI_URL	:= https://github.com/iotmaxx/gw-cli/releases/download/$(PYTHON3_GW_CLI_VERSION)/$(PYTHON3_GW_CLI).$(PYTHON3_GW_CLI_SUFFIX)
PYTHON3_GW_CLI_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW_CLI).$(PYTHON3_GW_CLI_SUFFIX)
PYTHON3_GW_CLI_DIR	:= $(BUILDDIR)/$(PYTHON3_GW_CLI)
PYTHON3_GW_CLI_LICENSE	:= Apache


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_GW_CLI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw-cli.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_GW_CLI)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_GW_CLI_DIR)/site.cfg
	@$(call touch)



# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw-cli.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw-cli)
	@$(call install_fixup, python3-gw-cli, PRIORITY, optional)
	@$(call install_fixup, python3-gw-cli, SECTION, base)
	@$(call install_fixup, python3-gw-cli, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-gw-cli, DESCRIPTION, missing)

		@$(call install_glob, python3-gw-cli, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw-cli)

	@$(call touch)

# vim: syntax=make
