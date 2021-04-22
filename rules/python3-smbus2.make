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
PACKAGES-$(PTXCONF_PYTHON3_SMBUS2) += python3-smbus2

#
# Paths and names
#
PYTHON3_SMBUS2_VERSION	:= 0.3.0
PYTHON3_SMBUS2_MD5	:= d5ed5acc889b4770a84cc932853ed20a
PYTHON3_SMBUS2		:= smbus2-$(PYTHON3_SMBUS2_VERSION)
PYTHON3_SMBUS2_SUFFIX	:= tar.gz
PYTHON3_SMBUS2_URL	:= https://files.pythonhosted.org/packages/6a/06/80a6928e5cbfd40c77c08e06ae9975c2a50109586ce66435bd8166ce6bb3/$(PYTHON3_SMBUS2).$(PYTHON3_SMBUS2_SUFFIX)
PYTHON3_SMBUS2_SOURCE	:= $(SRCDIR)/$(PYTHON3_SMBUS2).$(PYTHON3_SMBUS2_SUFFIX)
PYTHON3_SMBUS2_DIR	:= $(BUILDDIR)/$(PYTHON3_SMBUS2)
PYTHON3_SMBUS2_LICENSE	:= MIT
#PYTHON3_SMBUS2_LICENSE_FILES := \
#	file://LICENSE;md5=2077511c543a7c85245a516c47f4de78


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SMBUS2_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-smbus2.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_SMBUS2)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_SMBUS2_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-smbus2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-smbus2)
	@$(call install_fixup, python3-smbus2, PRIORITY, optional)
	@$(call install_fixup, python3-smbus2, SECTION, base)
	@$(call install_fixup, python3-smbus2, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-smbus2, DESCRIPTION, missing)

		@$(call install_glob, python3-smbus2, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/smbus2,,  *.py)

	@$(call install_finish, python3-smbus2)

	@$(call touch)

# vim: syntax=make
