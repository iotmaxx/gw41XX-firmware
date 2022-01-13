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
PACKAGES-$(PTXCONF_PYTHON3_GUNICORN) += python3-gunicorn

#
# Paths and names
#
PYTHON3_GUNICORN_VERSION	:= 20.1.0
PYTHON3_GUNICORN_MD5		:= db8a7c5c2064000af70286534803bf1d
PYTHON3_GUNICORN		:= gunicorn-$(PYTHON3_GUNICORN_VERSION)
PYTHON3_GUNICORN_SUFFIX		:= tar.gz
PYTHON3_GUNICORN_URL		:= $(call ptx/mirror-pypi, gunicorn, $(PYTHON3_GUNICORN).$(PYTHON3_GUNICORN_SUFFIX))
PYTHON3_GUNICORN_SOURCE		:= $(SRCDIR)/$(PYTHON3_GUNICORN).$(PYTHON3_GUNICORN_SUFFIX)
PYTHON3_GUNICORN_DIR		:= $(BUILDDIR)/$(PYTHON3_GUNICORN)
PYTHON3_GUNICORN_LICENSE	:= unknown
PYTHON3_GUNICORN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GUNICORN_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GUNICORN)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GUNICORN_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GUNICORN_CONF_TOOL	:= python3
#PYTHON3_GUNICORN_CONF_OPT	:= 

#$(STATEDIR)/python3-gunicorn.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GUNICORN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gunicorn.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GUNICORN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gunicorn.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GUNICORN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gunicorn.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gunicorn)
	@$(call install_fixup, python3-gunicorn,PRIORITY,optional)
	@$(call install_fixup, python3-gunicorn,SECTION,base)
	@$(call install_fixup, python3-gunicorn,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gunicorn,DESCRIPTION,missing)

	#@$(call install_copy, python3-gunicorn, 0, 0, 0755, $(PYTHON3_GUNICORN_DIR)/foobar, /dev/null)
#                @$(call install_glob, python3-six, 0, 0, -, \
#                /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_glob, python3-gunicorn, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)
	#@$(call install_glob, python3-gunicorn, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_tree, python3-gunicorn, 0, 0, -, /usr/bin)
	@$(call install_finish, python3-gunicorn)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gunicorn.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GUNICORN)

# vim: syntax=make
