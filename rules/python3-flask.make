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
PACKAGES-$(PTXCONF_PYTHON3_FLASK) += python3-flask

#
# Paths and names
#
PYTHON3_FLASK_VERSION	:= 1.1.2
PYTHON3_FLASK_MD5	:= 0da4145d172993cd28a6c619630cc19c
PYTHON3_FLASK		:= Flask-$(PYTHON3_FLASK_VERSION)
PYTHON3_FLASK_SUFFIX	:= tar.gz
PYTHON3_FLASK_URL	:= https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d/$(PYTHON3_FLASK).$(PYTHON3_FLASK_SUFFIX)
PYTHON3_FLASK_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK).$(PYTHON3_FLASK_SUFFIX)
PYTHON3_FLASK_DIR	:= $(BUILDDIR)/$(PYTHON3_FLASK)
PYTHON3_FLASK_LICENSE	:= BSD-3
PYTHON3_FLASK_LICENSE_FILES := \
	file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_FLASK)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_FLASK_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask)
	@$(call install_fixup, python3-flask, PRIORITY, optional)
	@$(call install_fixup, python3-flask, SECTION, base)
	@$(call install_fixup, python3-flask, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-flask, DESCRIPTION, missing)

		@$(call install_glob, python3-flask, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/flask,,  *.py)

	@$(call install_finish, python3-flask)

	@$(call touch)

# vim: syntax=make
