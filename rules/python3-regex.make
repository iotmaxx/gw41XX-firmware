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
PACKAGES-$(PTXCONF_PYTHON3_REGEX) += python3-regex

#
# Paths and names
#
PYTHON3_REGEX_VERSION		:= 2021.8.28
PYTHON3_REGEX_MD5		:= a8fc8b98b30f816eda5ed5c351ab6c9d
PYTHON3_REGEX			:= regex-$(PYTHON3_REGEX_VERSION)
PYTHON3_REGEX_SUFFIX		:= tar.gz
PYTHON3_REGEX_URL		:= https://files.pythonhosted.org/packages/15/bd/88d793c2e39b1e91c070bf4d1317db599b1c22efbf6bd194bb568064af21/$(PYTHON3_REGEX).$(PYTHON3_REGEX_SUFFIX)
PYTHON3_REGEX_SOURCE		:= $(SRCDIR)/$(PYTHON3_REGEX).$(PYTHON3_REGEX_SUFFIX)
PYTHON3_REGEX_DIR		:= $(BUILDDIR)/$(PYTHON3_REGEX)
PYTHON3_REGEX_LICENSE		:= Apache-2.0
PYTHON3_REGEX_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_REGEX_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_REGEX)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_REGEX_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_REGEX_CONF_TOOL	:= python3
#PYTHON3_REGEX_CONF_OPT	:= 

#$(STATEDIR)/python3-regex.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_REGEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-regex.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_REGEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-regex.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_REGEX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-regex.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-regex)
	@$(call install_fixup, python3-regex,PRIORITY,optional)
	@$(call install_fixup, python3-regex,SECTION,base)
	@$(call install_fixup, python3-regex,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-regex,DESCRIPTION,missing)

#@$(call install_copy, python3-spidev, 0, 0, 0644, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/spidev.cpython-37m-arm-linux-gnueabihf.so)
	@$(call install_glob, python3-regex, 0, 0, -, $(PYTHON3_SITEPACKAGES)/regex,, *.pyc)
#	@$(call install_copy, python3-regex, 0, 0, 0644, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/regex/_regex.cpython-37m-arm-linux-gnueabihf.so)
	@$(call install_finish, python3-regex)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-regex.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_REGEX)

# vim: syntax=make
