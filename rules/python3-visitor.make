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
PACKAGES-$(PTXCONF_PYTHON3_VISITOR) += python3-visitor

#
# Paths and names
#
PYTHON3_VISITOR_VERSION	:= 0.1.3
PYTHON3_VISITOR_MD5	:= 94a024ed0ec1b02b4497c15267d319ca
PYTHON3_VISITOR		:= visitor-$(PYTHON3_VISITOR_VERSION)
PYTHON3_VISITOR_SUFFIX	:= tar.gz
PYTHON3_VISITOR_URL	:= https://files.pythonhosted.org/packages/d7/58/785fcd6de4210049da5fafe62301b197f044f3835393594be368547142b0/$(PYTHON3_VISITOR).$(PYTHON3_VISITOR_SUFFIX)
PYTHON3_VISITOR_SOURCE	:= $(SRCDIR)/$(PYTHON3_VISITOR).$(PYTHON3_VISITOR_SUFFIX)
PYTHON3_VISITOR_DIR	:= $(BUILDDIR)/$(PYTHON3_VISITOR)
PYTHON3_VISITOR_LICENSE	:= MIT
PYTHON3_VISITOR_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_VISITOR_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_VISITOR)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_VISITOR_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_VISITOR_CONF_TOOL	:= python3
#PYTHON3_VISITOR_CONF_OPT	:= 

#$(STATEDIR)/python3-visitor.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_VISITOR)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-visitor.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_VISITOR)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-visitor.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_VISITOR)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-visitor.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-visitor)
	@$(call install_fixup, python3-visitor,PRIORITY,optional)
	@$(call install_fixup, python3-visitor,SECTION,base)
	@$(call install_fixup, python3-visitor,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-visitor,DESCRIPTION,missing)

#	@$(call install_copy, python3-visitor, 0, 0, 0755, $(PYTHON3_VISITOR_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-visitor, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-visitor)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-visitor.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_VISITOR)

# vim: syntax=make
