# -*-makefile-*-
#
# Copyright (C) 2021 by <Ralf Glaser>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_LAUNCHER) += python3-gw4xxx-launcher

#
# Paths and names
#
PYTHON3_GW4XXX_LAUNCHER_VERSION	:= 0.2.1
PYTHON3_GW4XXX_LAUNCHER_MD5	:= b84ecbdbdf658b0040a03e1a7224315e
PYTHON3_GW4XXX_LAUNCHER		:= python3-gw4xxx-launcher-$(PYTHON3_GW4XXX_LAUNCHER_VERSION)
PYTHON3_GW4XXX_LAUNCHER_SUFFIX	:= zip
PYTHON3_GW4XXX_LAUNCHER_URL	:= https://github.com/iotmaxx/gw4xxx-launcher/archive/refs/tags/$(PYTHON3_GW4XXX_LAUNCHER_VERSION).$(PYTHON3_GW4XXX_LAUNCHER_SUFFIX)
PYTHON3_GW4XXX_LAUNCHER_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_LAUNCHER).$(PYTHON3_GW4XXX_LAUNCHER_SUFFIX)
PYTHON3_GW4XXX_LAUNCHER_DIR	:= $(BUILDDIR)/$(PYTHON3_GW4XXX_LAUNCHER)
PYTHON3_GW4XXX_LAUNCHER_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW4XXX_LAUNCHER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_LAUNCHER_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_LAUNCHER)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_LAUNCHER_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_LAUNCHER_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_LAUNCHER_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-launcher.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_LAUNCHER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-launcher.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_LAUNCHER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-launcher.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_LAUNCHER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-launcher.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-launcher)
	@$(call install_fixup, python3-gw4xxx-launcher,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-launcher,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-launcher,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-launcher,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-launcher, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_copy, python3-gw4xxx-launcher, 0, 0, 0644, $(PYTHON3_GW4XXX_LAUNCHER_DIR)/iot_launcher.service, /etc/systemd/system/iot_launcher.service)

	@$(call install_link, python3-gw4xxx-launcher, /etc/systemd/system/iot_launcher.service, \
                /etc/systemd/system/multi-user.target.wants/iot_launcher.service)

	$(call install_copy, python3-gw4xxx-launcher, 0, 0, 0755, /config/iot_launcher.d)
#	python3 -c 'import json; launchMe = {"launch": $(PTXCONF_LAUNCH_ADAPTER)};jfile=open("$(PYTHON3_GW4XXX_LAUNCHER_DIR)/iot_launcher.json", "w"); json.dump(launchMe,jfile);jfile.close()'
#	@$(call install_copy, python3-gw4xxx-launcher, 0, 0, 0644, $(PYTHON3_GW4XXX_LAUNCHER_DIR)/iot_launcher.json, /config/iot_launcher.json)
	@$(call install_copy, python3-gw4xxx-launcher, 0, 0, 0755, $(PYTHON3_GW4XXX_LAUNCHER_DIR)/iot_launcher_create_config, /etc/rc.once.d/iot_launcher_create_config)
	 
	@$(call install_finish, python3-gw4xxx-launcher)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-launcher.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_LAUNCHER)

# vim: syntax=make
