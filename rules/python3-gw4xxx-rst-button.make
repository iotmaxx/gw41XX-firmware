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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_RST_BUTTON) += python3-gw4xxx-rst-button

#
# Paths and names
#
PYTHON3_GW4XXX_RST_BUTTON_VERSION	:= 0.1.0
PYTHON3_GW4XXX_RST_BUTTON_MD5		:= 8c7b6ff67c3e50e2b19ac532a0128c25
PYTHON3_GW4XXX_RST_BUTTON		:= gw4xxx-rst-button-$(PYTHON3_GW4XXX_RST_BUTTON_VERSION)
PYTHON3_GW4XXX_RST_BUTTON_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_RST_BUTTON_URL		:= https://github.com/iotmaxx/gw4xxx-rst-button/archive/refs/tags/$(PYTHON3_GW4XXX_RST_BUTTON_VERSION).$(PYTHON3_GW4XXX_RST_BUTTON_SUFFIX)
PYTHON3_GW4XXX_RST_BUTTON_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_RST_BUTTON).$(PYTHON3_GW4XXX_RST_BUTTON_SUFFIX)
PYTHON3_GW4XXX_RST_BUTTON_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_RST_BUTTON)
PYTHON3_GW4XXX_RST_BUTTON_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW4XXX_RST_BUTTON_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_RST_BUTTON_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_RST_BUTTON)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_RST_BUTTON_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_RST_BUTTON_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_RST_BUTTON_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-rst-button.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_RST_BUTTON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-rst-button.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_RST_BUTTON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-rst-button.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_RST_BUTTON)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-rst-button.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-rst-button)
	@$(call install_fixup, python3-gw4xxx-rst-button,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-rst-button,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-rst-button,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-rst-button,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-rst-button, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_copy, python3-gw4xxx-rst-button, 0, 0, 0644, $(PYTHON3_GW4XXX_RST_BUTTON_DIR)/iot_rst_button.service, \
		/etc/systemd/system/iot_rst_button.service)

	@$(call install_link, python3-gw4xxx-rst-button, /etc/systemd/system/iot_rst_button.service, \
		/etc/systemd/system/multi-user.target.wants/iot_rst_button.service)

#	@$(call install_copy, python3-gw4xxx-rst-button, 0, 0, 0755, $(PYTHON3_GW4XXX_RST_BUTTON_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-gw4xxx-rst-button)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-rst-button.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_RST_BUTTON)

# vim: syntax=make
