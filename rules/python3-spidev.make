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
PACKAGES-$(PTXCONF_PYTHON3_SPIDEV) += python3-spidev

#
# Paths and names
#
PYTHON3_SPIDEV_VERSION	:= 3.5
PYTHON3_SPIDEV_MD5	:= 7007e4fff2750025e233d8dfe46be670
PYTHON3_SPIDEV		:= spidev-$(PYTHON3_SPIDEV_VERSION)
PYTHON3_SPIDEV_SUFFIX	:= tar.gz
PYTHON3_SPIDEV_URL	:= https://files.pythonhosted.org/packages/62/56/de649e7d95f9fcfaf965a6eb937b4a46bc77ef21487c99cde1a7a0546040/$(PYTHON3_SPIDEV).$(PYTHON3_SPIDEV_SUFFIX)
PYTHON3_SPIDEV_SOURCE	:= $(SRCDIR)/$(PYTHON3_SPIDEV).$(PYTHON3_SPIDEV_SUFFIX)
PYTHON3_SPIDEV_DIR	:= $(BUILDDIR)/$(PYTHON3_SPIDEV)
PYTHON3_SPIDEV_LICENSE	:= MIT
PYTHON3_SPIDEV_LICENSE_FILES := \
	file://LICENSE;md5=2077511c543a7c85245a516c47f4de78


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SPIDEV_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-spidev.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_SPIDEV)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_SPIDEV_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-spidev.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-spidev)
	@$(call install_fixup, python3-spidev, PRIORITY, optional)
	@$(call install_fixup, python3-spidev, SECTION, base)
	@$(call install_fixup, python3-spidev, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-spidev, DESCRIPTION, missing)

	@$(call install_copy, python3-spidev, 0, 0, 0644, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/spidev.cpython-37m-arm-linux-gnueabihf.so)

	@$(call install_finish, python3-spidev)

	@$(call touch)

# vim: syntax=make
