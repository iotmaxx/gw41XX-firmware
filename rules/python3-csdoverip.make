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
PACKAGES-$(PTXCONF_PYTHON3_CSDOVERIP) += python3-csdoverip

#
# Paths and names
#
PYTHON3_CSDOVERIP_VERSION	:= 0.3.13
PYTHON3_CSDOVERIP_MD5		:= 266ae20856c5cc4ea82b5f75b5c70385
PYTHON3_CSDOVERIP		:= CSDoverIP-$(PYTHON3_CSDOVERIP_VERSION)
PYTHON3_CSDOVERIP_SUFFIX	:= tar.gz
PYTHON3_CSDOVERIP_URL		:= http://172.17.0.1:8080/iotmaxx/$(PYTHON3_CSDOVERIP).$(PYTHON3_CSDOVERIP_SUFFIX)
PYTHON3_CSDOVERIP_SOURCE	:= $(SRCDIR)/$(PYTHON3_CSDOVERIP).$(PYTHON3_CSDOVERIP_SUFFIX)
PYTHON3_CSDOVERIP_DIR		:= $(BUILDDIR)/$(PYTHON3_CSDOVERIP)
PYTHON3_CSDOVERIP_LICENSE	:= unknown
PYTHON3_CSDOVERIP_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CSDOVERIP_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CSDOVERIP)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CSDOVERIP_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CSDOVERIP_CONF_TOOL	:= python3
#PYTHON3_CSDOVERIP_CONF_OPT	:= 

#$(STATEDIR)/python3-csdoverip.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CSDOVERIP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-csdoverip.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CSDOVERIP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-csdoverip.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CSDOVERIP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-csdoverip.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-csdoverip)
	@$(call install_fixup, python3-csdoverip,PRIORITY,optional)
	@$(call install_fixup, python3-csdoverip,SECTION,base)
	@$(call install_fixup, python3-csdoverip,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-csdoverip,DESCRIPTION,missing)

#	@$(call install_copy, python3-csdoverip, 0, 0, 0755, $(PYTHON3_CSDOVERIP_DIR)/foobar, /dev/null)
	@$(call install_copy, python3-csdoverip, 0, 0, 0755, $(PYTHON3_CSDOVERIP_DIR)/root/etc/rc.once.d/csdoverip_create_service, /etc/rc.once.d/csdoverip_create_service)
	@$(call install_glob, python3-csdoverip, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-csdoverip)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-csdoverip.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CSDOVERIP)

# vim: syntax=make
