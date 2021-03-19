# -*-makefile-*-
#
# Copyright (C) 2021 by Steffen Trumtrar <s.trumtrar@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_EEPROM_TOOLS) += eeprom-tools

#
# Paths and names
#
EEPROM_TOOLS_VERSION	:= 20200315
EEPROM_TOOLS_MD5	:=
EEPROM_TOOLS		:= eeprom-tools-$(EEPROM_TOOLS_VERSION)
EEPROM_TOOLS_URL	:= lndir://local_src/$(EEPROM_TOOLS)
EEPROM_TOOLS_DIR	:= $(BUILDDIR)/$(EEPROM_TOOLS)
EEPROM_TOOLS_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

EEPROM_TOOLS_CONF_TOOL	:= NO
EEPROM_TOOLS_MAKE_ENV	:= $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/eeprom-tools.targetinstall:
	@$(call targetinfo)

	@$(call install_init, eeprom-tools)
	@$(call install_fixup, eeprom-tools,PRIORITY,optional)
	@$(call install_fixup, eeprom-tools,SECTION,base)
	@$(call install_fixup, eeprom-tools,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup, eeprom-tools,DESCRIPTION,missing)

	@$(call install_copy, eeprom-tools, 0, 0, 0755, $(EEPROM_TOOLS_DIR)/eepromDumper, \
		/usr/bin/eepromDumper)
	@$(call install_copy, eeprom-tools, 0, 0, 0755, $(EEPROM_TOOLS_DIR)/eepromWriter, \
		/usr/bin/eepromWriter)

	@$(call install_finish, eeprom-tools)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/eeprom-tools.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, EEPROM_TOOLS)

# vim: syntax=make
