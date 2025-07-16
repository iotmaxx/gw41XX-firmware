# -*-makefile-*-
#
# Copyright (C) 2025 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_JSONSCHEMA) += python3-jsonschema

#
# Paths and names
#
PYTHON3_JSONSCHEMA_VERSION	:= 4.24.0
PYTHON3_JSONSCHEMA_MD5		:= 168a114dcc5c3f977b7a10795fe3d99d
PYTHON3_JSONSCHEMA		:= jsonschema-$(PYTHON3_JSONSCHEMA_VERSION)
PYTHON3_JSONSCHEMA_SUFFIX	:= tar.gz
PYTHON3_JSONSCHEMA_URL		:= $(call ptx/mirror-pypi, jsonschema, $(PYTHON3_JSONSCHEMA).$(PYTHON3_JSONSCHEMA_SUFFIX))
PYTHON3_JSONSCHEMA_SOURCE	:= $(SRCDIR)/$(PYTHON3_JSONSCHEMA).$(PYTHON3_JSONSCHEMA_SUFFIX)
PYTHON3_JSONSCHEMA_DIR		:= $(BUILDDIR)/$(PYTHON3_JSONSCHEMA)
PYTHON3_JSONSCHEMA_LICENSE	:= MIT
PYTHON3_JSONSCHEMA_LICENSE_FILES	:= file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_JSONSCHEMA_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_JSONSCHEMA)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_JSONSCHEMA_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_JSONSCHEMA_CONF_TOOL	:= python3
#PYTHON3_JSONSCHEMA_CONF_OPT	:= 

#$(STATEDIR)/python3-jsonschema.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_JSONSCHEMA)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonschema.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_JSONSCHEMA)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonschema.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_JSONSCHEMA)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jsonschema.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jsonschema)
	@$(call install_fixup, python3-jsonschema,PRIORITY,optional)
	@$(call install_fixup, python3-jsonschema,SECTION,base)
	@$(call install_fixup, python3-jsonschema,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-jsonschema,DESCRIPTION,missing)

	@$(call install_glob, python3-jsonschema, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-jsonschema)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonschema.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_JSONSCHEMA)

# vim: syntax=make
