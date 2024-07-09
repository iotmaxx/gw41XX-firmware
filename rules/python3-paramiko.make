# -*-makefile-*-
#
# Copyright (C) 2024 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_PARAMIKO) += python3-paramiko

#
# Paths and names
#
PYTHON3_PARAMIKO_VERSION	:= 3.4.0
PYTHON3_PARAMIKO_MD5		:= be485ba66b576d8bc7e1c0ad96e87108
PYTHON3_PARAMIKO		:= paramiko-$(PYTHON3_PARAMIKO_VERSION)
PYTHON3_PARAMIKO_SUFFIX		:= tar.gz
PYTHON3_PARAMIKO_URL		:= $(call ptx/mirror-pypi, paramiko, $(PYTHON3_PARAMIKO).$(PYTHON3_PARAMIKO_SUFFIX))
PYTHON3_PARAMIKO_SOURCE		:= $(SRCDIR)/$(PYTHON3_PARAMIKO).$(PYTHON3_PARAMIKO_SUFFIX)
PYTHON3_PARAMIKO_DIR		:= $(BUILDDIR)/$(PYTHON3_PARAMIKO)
PYTHON3_PARAMIKO_LICENSE	:= LGPL-3.0-or-later
PYTHON3_PARAMIKO_LICENSE_FILES	:= file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PARAMIKO_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PARAMIKO)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PARAMIKO_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PARAMIKO_CONF_TOOL	:= python3
#PYTHON3_PARAMIKO_CONF_OPT	:= 

#$(STATEDIR)/python3-paramiko.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PARAMIKO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paramiko.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PARAMIKO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paramiko.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PARAMIKO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-paramiko.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-paramiko)
	@$(call install_fixup, python3-paramiko,PRIORITY,optional)
	@$(call install_fixup, python3-paramiko,SECTION,base)
	@$(call install_fixup, python3-paramiko,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-paramiko,DESCRIPTION,missing)

#	@$(call install_copy, python3-paramiko, 0, 0, 0755, $(PYTHON3_PARAMIKO_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-paramiko, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-paramiko)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paramiko.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PARAMIKO)

# vim: syntax=make
