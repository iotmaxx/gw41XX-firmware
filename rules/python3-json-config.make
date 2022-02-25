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
PACKAGES-$(PTXCONF_PYTHON3_JSON_CONFIG) += python3-json-config

#
# Paths and names
#
PYTHON3_JSON_CONFIG_VERSION	:= 0.1.1
PYTHON3_JSON_CONFIG_MD5		:= 1e163fb0ac206ccde58e7038525c64b8
PYTHON3_JSON_CONFIG		:= json-config-$(PYTHON3_JSON_CONFIG_VERSION)
PYTHON3_JSON_CONFIG_SUFFIX	:= tar.gz
PYTHON3_JSON_CONFIG_URL		:= https://github.com/iotmaxx/json-config/archive/$(PYTHON3_JSON_CONFIG_VERSION)/$(PYTHON3_JSON_CONFIG).$(PYTHON3_JSON_CONFIG_SUFFIX)
PYTHON3_JSON_CONFIG_SOURCE	:= $(SRCDIR)/$(PYTHON3_JSON_CONFIG).$(PYTHON3_JSON_CONFIG_SUFFIX)
PYTHON3_JSON_CONFIG_DIR		:= $(BUILDDIR)/$(PYTHON3_JSON_CONFIG)
PYTHON3_JSON_CONFIG_LICENSE	:= GPL-3.0-or-later
PYTHON3_JSON_CONFIG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_JSON_CONFIG_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_JSON_CONFIG)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_JSON_CONFIG_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_JSON_CONFIG_CONF_TOOL	:= python3
#PYTHON3_JSON_CONFIG_CONF_OPT	:= 

#$(STATEDIR)/python3-json-config.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_JSON_CONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-json-config.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_JSON_CONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-json-config.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_JSON_CONFIG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-json-config.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-json-config)
	@$(call install_fixup, python3-json-config,PRIORITY,optional)
	@$(call install_fixup, python3-json-config,SECTION,base)
	@$(call install_fixup, python3-json-config,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-json-config,DESCRIPTION,missing)

#	@$(call install_copy, python3-json-config, 0, 0, 0755, $(PYTHON3_JSON_CONFIG_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-json-config, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-json-config)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-json-config.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_JSON_CONFIG)

# vim: syntax=make
