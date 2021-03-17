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
PACKAGES-$(PTXCONF_PYTHON3_WERKZEUG) += python3-werkzeug

#
# Paths and names
#
PYTHON3_WERKZEUG_VERSION	:= 1.0.1
PYTHON3_WERKZEUG_MD5	:= 5d499cfdd30de5d9c946994783772efd
PYTHON3_WERKZEUG		:= Werkzeug-$(PYTHON3_WERKZEUG_VERSION)
PYTHON3_WERKZEUG_SUFFIX	:= tar.gz
PYTHON3_WERKZEUG_URL	:= https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04/$(PYTHON3_WERKZEUG).$(PYTHON3_WERKZEUG_SUFFIX)
PYTHON3_WERKZEUG_SOURCE	:= $(SRCDIR)/$(PYTHON3_WERKZEUG).$(PYTHON3_WERKZEUG_SUFFIX)
PYTHON3_WERKZEUG_DIR	:= $(BUILDDIR)/$(PYTHON3_WERKZEUG)
PYTHON3_WERKZEUG_LICENSE	:= MIT
PYTHON3_WERKZEUG_LICENSE_FILES := \
	file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WERKZEUG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-werkzeug.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_WERKZEUG)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_WERKZEUG_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-werkzeug.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-werkzeug)
	@$(call install_fixup, python3-werkzeug, PRIORITY, optional)
	@$(call install_fixup, python3-werkzeug, SECTION, base)
	@$(call install_fixup, python3-werkzeug, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-werkzeug, DESCRIPTION, missing)

		@$(call install_glob, python3-werkzeug, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/werkzeug,,  *.py)

	@$(call install_finish, python3-werkzeug)

	@$(call touch)

# vim: syntax=make
