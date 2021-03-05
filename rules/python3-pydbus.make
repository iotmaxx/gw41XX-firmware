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
PACKAGES-$(PTXCONF_PYTHON3_PYDBUS) += python3-pydbus

#
# Paths and names
#
PYTHON3_PYDBUS_VERSION	:= 0.6.0
PYTHON3_PYDBUS_MD5	:= c6abd44862322679bd4e907bebc3e0d0
PYTHON3_PYDBUS		:= pydbus-$(PYTHON3_PYDBUS_VERSION)
PYTHON3_PYDBUS_SUFFIX	:= tar.gz
PYTHON3_PYDBUS_URL	:= https://files.pythonhosted.org/packages/58/56/3e84f2c1f2e39b9ea132460183f123af41e3b9c8befe222a35636baa6a5a/$(PYTHON3_PYDBUS).$(PYTHON3_PYDBUS_SUFFIX)
PYTHON3_PYDBUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYDBUS).$(PYTHON3_PYDBUS_SUFFIX)
PYTHON3_PYDBUS_DIR	:= $(BUILDDIR)/$(PYTHON3_PYDBUS)
PYTHON3_PYDBUS_LICENSE	:= Apache


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYDBUS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pydbus.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYDBUS)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYDBUS_DIR)/site.cfg
	@$(call touch)



# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pydbus.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pydbus)
	@$(call install_fixup, python3-pydbus, PRIORITY, optional)
	@$(call install_fixup, python3-pydbus, SECTION, base)
	@$(call install_fixup, python3-pydbus, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-pydbus, DESCRIPTION, missing)

		@$(call install_glob, python3-pydbus, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/pydbus,,  *.py)

	@$(call install_finish, python3-pydbus)

	@$(call touch)

# vim: syntax=make
