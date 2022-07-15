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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_RESTFUL) += python3-flask-restful

#
# Paths and names
#
PYTHON3_FLASK_RESTFUL_VERSION	:= 0.3.9
PYTHON3_FLASK_RESTFUL_MD5	:= d5c3e0b452722297a2f1446b7ee54e53
PYTHON3_FLASK_RESTFUL		:= Flask-RESTful-$(PYTHON3_FLASK_RESTFUL_VERSION)
PYTHON3_FLASK_RESTFUL_SUFFIX	:= tar.gz
PYTHON3_FLASK_RESTFUL_URL	:= $(call ptx/mirror-pypi, Flask-RESTful, $(PYTHON3_FLASK_RESTFUL).$(PYTHON3_FLASK_RESTFUL_SUFFIX))
PYTHON3_FLASK_RESTFUL_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_RESTFUL).$(PYTHON3_FLASK_RESTFUL_SUFFIX)
PYTHON3_FLASK_RESTFUL_DIR	:= $(BUILDDIR)/$(PYTHON3_FLASK_RESTFUL)
PYTHON3_FLASK_RESTFUL_LICENSE	:= BSD-2-Clause
PYTHON3_FLASK_RESTFUL_LICENSE_FILES	:= file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_FLASK_RESTFUL_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_FLASK_RESTFUL)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_FLASK_RESTFUL_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_FLASK_RESTFUL_CONF_TOOL	:= python3
#PYTHON3_FLASK_RESTFUL_CONF_OPT	:= 

#$(STATEDIR)/python3-flask-restful.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_FLASK_RESTFUL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-restful.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_FLASK_RESTFUL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-restful.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_FLASK_RESTFUL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-restful.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-restful)
	@$(call install_fixup, python3-flask-restful,PRIORITY,optional)
	@$(call install_fixup, python3-flask-restful,SECTION,base)
	@$(call install_fixup, python3-flask-restful,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-flask-restful,DESCRIPTION,missing)

	#@$(call install_copy, python3-flask-restful, 0, 0, 0755, $(PYTHON3_FLASK_RESTFUL_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-flask-restful, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-flask-restful)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-restful.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_FLASK_RESTFUL)

# vim: syntax=make
