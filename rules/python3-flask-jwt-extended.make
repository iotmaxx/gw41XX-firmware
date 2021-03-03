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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_JWT_EXTENDED) += python3-flask-jwt-extended

#
# Paths and names
#
PYTHON3_FLASK_JWT_EXTENDED_VERSION	:= 3.24.1
PYTHON3_FLASK_JWT_EXTENDED_MD5	:= 483245c2c290b5e58b424e0de2da603b
PYTHON3_FLASK_JWT_EXTENDED		:= Flask-JWT-Extended-$(PYTHON3_FLASK_JWT_EXTENDED_VERSION)
PYTHON3_FLASK_JWT_EXTENDED_SUFFIX	:= tar.gz
PYTHON3_FLASK_JWT_EXTENDED_URL	:= https://files.pythonhosted.org/packages/7a/ee/bb1c679b44ebec5c64626d632186d890cd95fffb63c1bded85d979a80724/$(PYTHON3_FLASK_JWT_EXTENDED).$(PYTHON3_FLASK_JWT_EXTENDED_SUFFIX)
PYTHON3_FLASK_JWT_EXTENDED_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_JWT_EXTENDED).$(PYTHON3_FLASK_JWT_EXTENDED_SUFFIX)
PYTHON3_FLASK_JWT_EXTENDED_DIR	:= $(BUILDDIR)/$(PYTHON3_FLASK_JWT_EXTENDED)
PYTHON3_FLASK_JWT_EXTENDED_LICENSE	:= MIT
PYTHON3_FLASK_JWT_EXTENDED_LICENSE_FILES := \
	file://LICENSE;md5=1b589eb51be8695ad5394e0c4c53a0e5


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_JWT_EXTENDED_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-jwt-extended.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_FLASK_JWT_EXTENDED)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_FLASK_JWT_EXTENDED_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-jwt-extended.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-jwt-extended)
	@$(call install_fixup, python3-flask-jwt-extended, PRIORITY, optional)
	@$(call install_fixup, python3-flask-jwt-extended, SECTION, base)
	@$(call install_fixup, python3-flask-jwt-extended, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-flask-jwt-extended, DESCRIPTION, missing)

		@$(call install_glob, python3-flask-jwt-extended, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/flask_jwt_extended,,  *.py)

	@$(call install_finish, python3-flask-jwt-extended)

	@$(call touch)

# vim: syntax=make
