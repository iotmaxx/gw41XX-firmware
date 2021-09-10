# -*-makefile-*-
#
# Copyright (C) 2021 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_FLASK_BOOTSTRAP) += python3-flask-bootstrap

#
# Paths and names
#
PYTHON3_FLASK_BOOTSTRAP_VERSION	:= 3.3.7.1
PYTHON3_FLASK_BOOTSTRAP_MD5	:= e40d50f5c5b6438c1c6200a6f2871f81
PYTHON3_FLASK_BOOTSTRAP		:= Flask-Bootstrap-$(PYTHON3_FLASK_BOOTSTRAP_VERSION)
PYTHON3_FLASK_BOOTSTRAP_SUFFIX	:= tar.gz
PYTHON3_FLASK_BOOTSTRAP_URL	:= https://files.pythonhosted.org/packages/88/53/958ce7c2aa26280b7fd7f3eecbf13053f1302ee2acb1db58ef32e1c23c2a/$(PYTHON3_FLASK_BOOTSTRAP).$(PYTHON3_FLASK_BOOTSTRAP_SUFFIX)
PYTHON3_FLASK_BOOTSTRAP_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_BOOTSTRAP).$(PYTHON3_FLASK_BOOTSTRAP_SUFFIX)
PYTHON3_FLASK_BOOTSTRAP_DIR	:= $(BUILDDIR)/$(PYTHON3_FLASK_BOOTSTRAP)
PYTHON3_FLASK_BOOTSTRAP_LICENSE	:= BSD-3-Clause
PYTHON3_FLASK_BOOTSTRAP_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_FLASK_BOOTSTRAP_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_FLASK_BOOTSTRAP)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_FLASK_BOOTSTRAP_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_FLASK_BOOTSTRAP_CONF_TOOL	:= python3
#PYTHON3_FLASK_BOOTSTRAP_CONF_OPT	:= 

#$(STATEDIR)/python3-flask-bootstrap.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_FLASK_BOOTSTRAP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-bootstrap.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_FLASK_BOOTSTRAP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-bootstrap.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_FLASK_BOOTSTRAP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-bootstrap.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-bootstrap)
	@$(call install_fixup, python3-flask-bootstrap,PRIORITY,optional)
	@$(call install_fixup, python3-flask-bootstrap,SECTION,base)
	@$(call install_fixup, python3-flask-bootstrap,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-flask-bootstrap,DESCRIPTION,missing)

#	@$(call install_copy, python3-flask-bootstrap, 0, 0, 0755, $(PYTHON3_FLASK_BOOTSTRAP_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-flask-bootstrap, 0, 0, -, $(PYTHON3_SITEPACKAGES)/flask_bootstrap,, *.pyc)

	@$(call install_finish, python3-flask-bootstrap)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-bootstrap.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_FLASK_BOOTSTRAP)

# vim: syntax=make
