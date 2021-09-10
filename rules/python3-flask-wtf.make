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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_WTF) += python3-flask-wtf

#
# Paths and names
#
PYTHON3_FLASK_WTF_VERSION	:= 0.15.1
PYTHON3_FLASK_WTF_MD5		:= 920a5a476ecfb751952b5048cc05fcf8
PYTHON3_FLASK_WTF		:= Flask-WTF-$(PYTHON3_FLASK_WTF_VERSION)
PYTHON3_FLASK_WTF_SUFFIX	:= tar.gz
PYTHON3_FLASK_WTF_URL		:= https://files.pythonhosted.org/packages/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3/$(PYTHON3_FLASK_WTF).$(PYTHON3_FLASK_WTF_SUFFIX)
PYTHON3_FLASK_WTF_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_WTF).$(PYTHON3_FLASK_WTF_SUFFIX)
PYTHON3_FLASK_WTF_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK_WTF)
PYTHON3_FLASK_WTF_LICENSE	:= BSD-3-Clause
PYTHON3_FLASK_WTF_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_FLASK_WTF_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_FLASK_WTF)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_FLASK_WTF_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_FLASK_WTF_CONF_TOOL	:= python3
#PYTHON3_FLASK_WTF_CONF_OPT	:= 

#$(STATEDIR)/python3-flask-wtf.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_FLASK_WTF)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-wtf.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_FLASK_WTF)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-wtf.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_FLASK_WTF)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-wtf.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-wtf)
	@$(call install_fixup, python3-flask-wtf,PRIORITY,optional)
	@$(call install_fixup, python3-flask-wtf,SECTION,base)
	@$(call install_fixup, python3-flask-wtf,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-flask-wtf,DESCRIPTION,missing)

#	@$(call install_copy, python3-flask-wtf, 0, 0, 0755, $(PYTHON3_FLASK_WTF_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-flask-wtf, 0, 0, -, $(PYTHON3_SITEPACKAGES)/flask_wtf,, *.pyc)

	@$(call install_finish, python3-flask-wtf)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-flask-wtf.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_FLASK_WTF)

# vim: syntax=make
