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
HOST_PACKAGES-$(PTXCONF_HOST_PYTHON3_PYCPARSER) += host-python3-pycparser

#
# Paths and names
#
HOST_PYTHON3_PYCPARSER_VERSION	:= 2.18
HOST_PYTHON3_PYCPARSER_MD5	:= 72370da54358202a60130e223d488136
HOST_PYTHON3_PYCPARSER		:= pycparser-$(HOST_PYTHON3_PYCPARSER_VERSION)
HOST_PYTHON3_PYCPARSER_SUFFIX	:= tar.gz
HOST_PYTHON3_PYCPARSER_URL	:= https://pypi.python.org/packages/source/p/pycparser/$(HOST_PYTHON3_PYCPARSER).$(HOST_PYTHON3_PYCPARSER_SUFFIX)
HOST_PYTHON3_PYCPARSER_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_PYCPARSER).$(HOST_PYTHON3_PYCPARSER_SUFFIX)
HOST_PYTHON3_PYCPARSER_DIR	:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_PYCPARSER)
HOST_PYTHON3_PYCPARSER_LICENSE	:= BSD-3-Clause
HOST_PYTHON3_PYCPARSER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(HOST_HOST_PYTHON3_PYCPARSER_SOURCE):
#	@$(call targetinfo)
#	@$(call get, HOST_HOST_PYTHON3_PYCPARSER)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#HOST_HOST_PYTHON3_PYCPARSER_CONF_ENV	:= $(HOST_ENV)

#
# python3
#
HOST_PYTHON3_PYCPARSER_CONF_TOOL	:= python3
#HOST_HOST_PYTHON3_PYCPARSER_CONF_OPT	:= 

#$(STATEDIR)/host-host-python3-pycparser.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, HOST_HOST_PYTHON3_PYCPARSER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-host-python3-pycparser.compile:
#	@$(call targetinfo)
#	@$(call world/compile, HOST_HOST_PYTHON3_PYCPARSER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-host-python3-pycparser.install:
#	@$(call targetinfo)
#	@$(call world/install, HOST_HOST_PYTHON3_PYCPARSER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-host-python3-pycparser.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, HOST_HOST_PYTHON3_PYCPARSER)

# vim: syntax=make
