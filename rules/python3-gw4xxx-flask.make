# -*-makefile-*-
#
# Copyright (C) 2022 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_FLASK) += python3-gw4xxx-flask

#
# Paths and names
#
PYTHON3_GW4XXX_FLASK_VERSION	:= 0.1.7
PYTHON3_GW4XXX_FLASK_MD5	:= 268fb72ebf2d7d9aef420df94dfb44c1
PYTHON3_GW4XXX_FLASK		:= python3-gw4xxx-flask-$(PYTHON3_GW4XXX_FLASK_VERSION)
PYTHON3_GW4XXX_FLASK_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_FLASK_URL	:= https://github.com/iotmaxx/gw4xxx-flask/archive/$(PYTHON3_GW4XXX_FLASK_VERSION)/$(PYTHON3_GW4XXX_FLASK).$(PYTHON3_GW4XXX_FLASK_SUFFIX)
PYTHON3_GW4XXX_FLASK_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_FLASK).$(PYTHON3_GW4XXX_FLASK_SUFFIX)
PYTHON3_GW4XXX_FLASK_DIR	:= $(BUILDDIR)/$(PYTHON3_GW4XXX_FLASK)
PYTHON3_GW4XXX_FLASK_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW4XXX_FLASK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_FLASK_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_FLASK)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_FLASK_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_FLASK_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_FLASK_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-flask.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_FLASK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-flask.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_FLASK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-flask.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_FLASK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-flask.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-flask)
	@$(call install_fixup, python3-gw4xxx-flask,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-flask,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-flask,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-flask,DESCRIPTION,missing)

#	@$(call install_copy, python3-gw4xxx-flask, 0, 0, 0755, $(PYTHON3_GW4XXX_FLASK_DIR)/foobar, /dev/null)
	@$(call install_copy, python3-gw4xxx-flask, 0, 0, 0755, $(PYTHON3_GW4XXX_FLASK_DIR)/root/etc/rc.once.d/flaskonhal_create_service, /etc/rc.once.d/flaskonhal_create_service)
	@$(call install_glob, python3-gw4xxx-flask, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py */tests)
	@$(call install_finish, python3-gw4xxx-flask)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-flask.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_FLASK)

# vim: syntax=make
