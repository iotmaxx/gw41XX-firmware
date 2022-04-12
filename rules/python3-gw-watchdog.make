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
PACKAGES-$(PTXCONF_PYTHON3_GW_WATCHDOG) += python3-gw-watchdog

#
# Paths and names
#
PYTHON3_GW_WATCHDOG_VERSION	:= 0.1.6
PYTHON3_GW_WATCHDOG_MD5		:= 6a37039316081be589a1048328f3bacf
PYTHON3_GW_WATCHDOG		:= gw-watchdog-$(PYTHON3_GW_WATCHDOG_VERSION)
PYTHON3_GW_WATCHDOG_SUFFIX	:= tar.gz
PYTHON3_GW_WATCHDOG_URL		:= https://github.com/iotmaxx/gw-watchdog/archive/$(PYTHON3_GW_WATCHDOG_VERSION)/$(PYTHON3_GW_WATCHDOG).$(PYTHON3_GW_WATCHDOG_SUFFIX)
PYTHON3_GW_WATCHDOG_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW_WATCHDOG).$(PYTHON3_GW_WATCHDOG_SUFFIX)
PYTHON3_GW_WATCHDOG_DIR		:= $(BUILDDIR)/$(PYTHON3_GW_WATCHDOG)
PYTHON3_GW_WATCHDOG_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW_WATCHDOG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW_WATCHDOG_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW_WATCHDOG)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW_WATCHDOG_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW_WATCHDOG_CONF_TOOL	:= python3
#PYTHON3_GW_WATCHDOG_CONF_OPT	:= 

#$(STATEDIR)/python3-gw-watchdog.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW_WATCHDOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw-watchdog.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW_WATCHDOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw-watchdog.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW_WATCHDOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw-watchdog.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw-watchdog)
	@$(call install_fixup, python3-gw-watchdog,PRIORITY,optional)
	@$(call install_fixup, python3-gw-watchdog,SECTION,base)
	@$(call install_fixup, python3-gw-watchdog,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw-watchdog,DESCRIPTION,missing)

#	@$(call install_copy, python3-gw-watchdog, 0, 0, 0755, $(PYTHON3_GW_WATCHDOG_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-gw-watchdog, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py */tests)

	@$(call install_copy, python3-gw-watchdog, 0, 0, 0644, $(PYTHON3_GW_WATCHDOG_DIR)/etc/systemd/system/gw-watchdog.service, /etc/systemd/system/gw-watchdog.service)
	@$(call install_copy, python3-gw-watchdog, 0, 0, 0644, $(PYTHON3_GW_WATCHDOG_DIR)/etc/systemd/system/gw-watchdog.timer, /etc/systemd/system/gw-watchdog.timer)

	@$(call install_link, python3-gw-watchdog, /etc/systemd/system/gw-watchdog.timer, \
                /etc/systemd/system/multi-user.target.wants/gw-watchdog.timer)

	@$(call install_finish, python3-gw-watchdog)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw-watchdog.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW_WATCHDOG)

# vim: syntax=make
