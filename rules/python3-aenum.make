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
PACKAGES-$(PTXCONF_PYTHON3_AENUM) += python3-aenum

#
# Paths and names
#
PYTHON3_AENUM_VERSION	:= 2.2.4
PYTHON3_AENUM_MD5	:= 8983562361efe5be865617341dadbb9b
PYTHON3_AENUM		:= aenum-$(PYTHON3_AENUM_VERSION)
PYTHON3_AENUM_SUFFIX	:= tar.gz
PYTHON3_AENUM_URL	:= https://files.pythonhosted.org/packages/01/bc/f1b15f6a310eadd68937e4aa7656b46cc64567e0c7709fa47b065dd5f257/$(PYTHON3_AENUM).$(PYTHON3_AENUM_SUFFIX)
PYTHON3_AENUM_SOURCE	:= $(SRCDIR)/$(PYTHON3_AENUM).$(PYTHON3_AENUM_SUFFIX)
PYTHON3_AENUM_DIR	:= $(BUILDDIR)/$(PYTHON3_AENUM)
PYTHON3_AENUM_LICENSE	:= BSD
#PYTHON3_AENUM_LICENSE_FILES := \
#	file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_AENUM_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-aenum.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_AENUM)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_AENUM_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-aenum.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-aenum)
	@$(call install_fixup, python3-aenum, PRIORITY, optional)
	@$(call install_fixup, python3-aenum, SECTION, base)
	@$(call install_fixup, python3-aenum, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-aenum, DESCRIPTION, missing)

		@$(call install_glob, python3-aenum, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/aenum,,  *.py)

	@$(call install_finish, python3-aenum)

	@$(call touch)

# vim: syntax=make
