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
PACKAGES-$(PTXCONF_PYTHON3_SIMPLEJSON) += python3-simplejson

#
# Paths and names
#
PYTHON3_SIMPLEJSON_VERSION	:= 3.17.5
PYTHON3_SIMPLEJSON_MD5		:= 1756427859454004e90e028d263cf23e
PYTHON3_SIMPLEJSON		:= simplejson-$(PYTHON3_SIMPLEJSON_VERSION)
PYTHON3_SIMPLEJSON_SUFFIX	:= tar.gz
PYTHON3_SIMPLEJSON_URL		:= https://files.pythonhosted.org/packages/01/52/41c71718f941c9a5abebfaa24e3c14e3c0229327b7ebd21348989845ed8f/$(PYTHON3_SIMPLEJSON).$(PYTHON3_SIMPLEJSON_SUFFIX)
PYTHON3_SIMPLEJSON_SOURCE	:= $(SRCDIR)/$(PYTHON3_SIMPLEJSON).$(PYTHON3_SIMPLEJSON_SUFFIX)
PYTHON3_SIMPLEJSON_DIR		:= $(BUILDDIR)/$(PYTHON3_SIMPLEJSON)
PYTHON3_SIMPLEJSON_LICENSE	:= MIT
PYTHON3_SIMPLEJSON_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_SIMPLEJSON_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_SIMPLEJSON)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_SIMPLEJSON_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_SIMPLEJSON_CONF_TOOL	:= python3
#PYTHON3_SIMPLEJSON_CONF_OPT	:= 

#$(STATEDIR)/python3-simplejson.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_SIMPLEJSON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-simplejson.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_SIMPLEJSON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-simplejson.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_SIMPLEJSON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-simplejson.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-simplejson)
	@$(call install_fixup, python3-simplejson,PRIORITY,optional)
	@$(call install_fixup, python3-simplejson,SECTION,base)
	@$(call install_fixup, python3-simplejson,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-simplejson,DESCRIPTION,missing)

#	@$(call install_copy, python3-simplejson, 0, 0, 0755, $(PYTHON3_SIMPLEJSON_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-simplejson, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_finish, python3-simplejson)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-simplejson.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_SIMPLEJSON)

# vim: syntax=make
