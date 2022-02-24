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
PACKAGES-$(PTXCONF_PYTHON3_CERTIFI) += python3-certifi

#
# Paths and names
#
PYTHON3_CERTIFI_VERSION	:= 2021.10.8
PYTHON3_CERTIFI_MD5	:= 880ed9e5d04aff8f46f5ff82a3a3e395
PYTHON3_CERTIFI		:= certifi-$(PYTHON3_CERTIFI_VERSION)
PYTHON3_CERTIFI_SUFFIX	:= tar.gz
PYTHON3_CERTIFI_URL	:= $(call ptx/mirror-pypi, certifi, $(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX))
PYTHON3_CERTIFI_SOURCE	:= $(SRCDIR)/$(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX)
PYTHON3_CERTIFI_DIR	:= $(BUILDDIR)/$(PYTHON3_CERTIFI)
PYTHON3_CERTIFI_LICENSE	:= MPL-2.0
PYTHON3_CERTIFI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CERTIFI_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CERTIFI)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CERTIFI_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CERTIFI_CONF_TOOL	:= python3
#PYTHON3_CERTIFI_CONF_OPT	:= 

#$(STATEDIR)/python3-certifi.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CERTIFI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-certifi.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CERTIFI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-certifi.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CERTIFI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-certifi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-certifi)
	@$(call install_fixup, python3-certifi,PRIORITY,optional)
	@$(call install_fixup, python3-certifi,SECTION,base)
	@$(call install_fixup, python3-certifi,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-certifi,DESCRIPTION,missing)

#	@$(call install_copy, python3-certifi, 0, 0, 0755, $(PYTHON3_CERTIFI_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-certifi, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-certifi)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-certifi.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CERTIFI)

# vim: syntax=make
