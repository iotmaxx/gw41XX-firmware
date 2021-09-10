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
PACKAGES-$(PTXCONF_PYTHON3_WTFORMS) += python3-wtforms

#
# Paths and names
#
PYTHON3_WTFORMS_VERSION	:= 2.3.3
PYTHON3_WTFORMS_MD5	:= 2b6ea167a71c6becf20f0934417fd06c
PYTHON3_WTFORMS		:= WTForms-$(PYTHON3_WTFORMS_VERSION)
PYTHON3_WTFORMS_SUFFIX	:= tar.gz
PYTHON3_WTFORMS_URL	:= https://files.pythonhosted.org/packages/dd/3f/f25d26b1c66896e2876124a12cd8be8f606abf4e1890a20f3ca04e4a1555/$(PYTHON3_WTFORMS).$(PYTHON3_WTFORMS_SUFFIX)
PYTHON3_WTFORMS_SOURCE	:= $(SRCDIR)/$(PYTHON3_WTFORMS).$(PYTHON3_WTFORMS_SUFFIX)
PYTHON3_WTFORMS_DIR	:= $(BUILDDIR)/$(PYTHON3_WTFORMS)
PYTHON3_WTFORMS_LICENSE	:= BSD-3-Clause
PYTHON3_WTFORMS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_WTFORMS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_WTFORMS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_WTFORMS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_WTFORMS_CONF_TOOL	:= python3
#PYTHON3_WTFORMS_CONF_OPT	:= 

#$(STATEDIR)/python3-wtforms.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_WTFORMS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-wtforms.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_WTFORMS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-wtforms.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_WTFORMS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-wtforms.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-wtforms)
	@$(call install_fixup, python3-wtforms,PRIORITY,optional)
	@$(call install_fixup, python3-wtforms,SECTION,base)
	@$(call install_fixup, python3-wtforms,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-wtforms,DESCRIPTION,missing)

#	@$(call install_copy, python3-wtforms, 0, 0, 0755, $(PYTHON3_WTFORMS_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-wtforms, 0, 0, -, $(PYTHON3_SITEPACKAGES)/wtforms,, *.pyc)
	@$(call install_finish, python3-wtforms)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-wtforms.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_WTFORMS)

# vim: syntax=make
