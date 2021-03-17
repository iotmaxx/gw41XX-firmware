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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_CORS) += python3-flask-cors

#
# Paths and names
#
PYTHON3_FLASK_CORS_VERSION	:= 3.0.8
PYTHON3_FLASK_CORS_MD5	:= 551cc4c0305a171d28caa2b3bc838867
PYTHON3_FLASK_CORS		:= Flask-Cors-$(PYTHON3_FLASK_CORS_VERSION)
PYTHON3_FLASK_CORS_SUFFIX	:= tar.gz
PYTHON3_FLASK_CORS_URL	:= https://files.pythonhosted.org/packages/9e/11/ca8b95c5bf9644471601e425f0de8cbd09a506bb6c24842cb17a6cd1eea8/$(PYTHON3_FLASK_CORS).$(PYTHON3_FLASK_CORS_SUFFIX)
PYTHON3_FLASK_CORS_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_CORS).$(PYTHON3_FLASK_CORS_SUFFIX)
PYTHON3_FLASK_CORS_DIR	:= $(BUILDDIR)/$(PYTHON3_FLASK_CORS)
PYTHON3_FLASK_CORS_LICENSE	:= MIT
PYTHON3_FLASK_CORS_LICENSE_FILES := \
	file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_CORS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-cors.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_FLASK_CORS)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_FLASK_CORS_DIR)/site.cfg
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-cors.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-cors)
	@$(call install_fixup, python3-flask-cors, PRIORITY, optional)
	@$(call install_fixup, python3-flask-cors, SECTION, base)
	@$(call install_fixup, python3-flask-cors, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-flask-cors, DESCRIPTION, missing)

		@$(call install_glob, python3-flask-cors, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/flask_cors,,  *.py)

	@$(call install_finish, python3-flask-cors)

	@$(call touch)

# vim: syntax=make
