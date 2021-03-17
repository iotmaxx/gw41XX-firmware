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
PACKAGES-$(PTXCONF_PYTHON3_PYTHON_CAN) += python3-python-can

#
# Paths and names
#
PYTHON3_PYTHON_CAN_VERSION	:= 3.3.4
PYTHON3_PYTHON_CAN_MD5	:= 305075968c56bd85130b19d86e9e505d
PYTHON3_PYTHON_CAN		:= python-can-$(PYTHON3_PYTHON_CAN_VERSION)
PYTHON3_PYTHON_CAN_SUFFIX	:= tar.gz
PYTHON3_PYTHON_CAN_URL	:= https://files.pythonhosted.org/packages/97/dd/5e5ae96db41ba57dde127e0600c3d324239ed692e167296c5fdb992cbf41/$(PYTHON3_PYTHON_CAN).$(PYTHON3_PYTHON_CAN_SUFFIX)
PYTHON3_PYTHON_CAN_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYTHON_CAN).$(PYTHON3_PYTHON_CAN_SUFFIX)
PYTHON3_PYTHON_CAN_DIR	:= $(BUILDDIR)/$(PYTHON3_PYTHON_CAN)
PYTHON3_PYTHON_CAN_LICENSE	:= GNU
#PYTHON3_PYTHON_CAN_LICENSE_FILES := \
#	file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYTHON_CAN_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-python-can.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_PYTHON_CAN)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_PYTHON_CAN_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-python-can.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-python-can)
	@$(call install_fixup, python3-python-can, PRIORITY, optional)
	@$(call install_fixup, python3-python-can, SECTION, base)
	@$(call install_fixup, python3-python-can, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-python-can, DESCRIPTION, missing)

		@$(call install_glob, python3-python-can, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/can,,  *.py)

	@$(call install_finish, python3-python-can)

	@$(call touch)

# vim: syntax=make
