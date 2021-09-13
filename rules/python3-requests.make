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
PACKAGES-$(PTXCONF_PYTHON3_REQUESTS) += python3-requests

#
# Paths and names
#
PYTHON3_REQUESTS_VERSION	:= 2.26.0
PYTHON3_REQUESTS_MD5		:= 8c745949ad3e9ae83d9927fed213db8a
PYTHON3_REQUESTS		:= requests-$(PYTHON3_REQUESTS_VERSION)
PYTHON3_REQUESTS_SUFFIX		:= tar.gz
PYTHON3_REQUESTS_URL		:= https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670/$(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX)
PYTHON3_REQUESTS_SOURCE		:= $(SRCDIR)/$(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX)
PYTHON3_REQUESTS_DIR		:= $(BUILDDIR)/$(PYTHON3_REQUESTS)
PYTHON3_REQUESTS_LICENSE	:= Apache-2.0
PYTHON3_REQUESTS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_REQUESTS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_REQUESTS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_REQUESTS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_REQUESTS_CONF_TOOL	:= python3
#PYTHON3_REQUESTS_CONF_OPT	:= 

#$(STATEDIR)/python3-requests.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_REQUESTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-requests.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_REQUESTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-requests.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_REQUESTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-requests.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-requests)
	@$(call install_fixup, python3-requests,PRIORITY,optional)
	@$(call install_fixup, python3-requests,SECTION,base)
	@$(call install_fixup, python3-requests,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-requests,DESCRIPTION,missing)

#	@$(call install_copy, python3-requests, 0, 0, 0755, $(PYTHON3_REQUESTS_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-requests, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)


	@$(call install_finish, python3-requests)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-requests.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_REQUESTS)

# vim: syntax=make
