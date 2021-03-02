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
PACKAGES-$(PTXCONF_PYTHON3_JINJA2) += python3-jinja2

#
# Paths and names
#
PYTHON3_JINJA2_VERSION	:= 2.11.2
PYTHON3_JINJA2_MD5	:= 0362203b22547abca06ed1082bc1e7b4
PYTHON3_JINJA2		:= Jinja2-$(PYTHON3_JINJA2_VERSION)
PYTHON3_JINJA2_SUFFIX	:= tar.gz
PYTHON3_JINJA2_URL	:= https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c/$(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX)
PYTHON3_JINJA2_SOURCE	:= $(SRCDIR)/$(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX)
PYTHON3_JINJA2_DIR	:= $(BUILDDIR)/$(PYTHON3_JINJA2)
PYTHON3_JINJA2_LICENSE	:= BSD-3
PYTHON3_JINJA2_LICENSE_FILES := \
	file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_JINJA2_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jinja2.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_JINJA2)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_JINJA2_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jinja2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jinja2)
	@$(call install_fixup, python3-jinja2, PRIORITY, optional)
	@$(call install_fixup, python3-jinja2, SECTION, base)
	@$(call install_fixup, python3-jinja2, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-jinja2, DESCRIPTION, missing)

		@$(call install_glob, python3-jinja2, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/jinja2,,  *.py)

	@$(call install_finish, python3-jinja2)

	@$(call touch)

# vim: syntax=make
