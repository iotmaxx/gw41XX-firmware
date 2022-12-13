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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_GPS_CTRL) += python3-gw4xxx-gps-ctrl

#
# Paths and names
#
PYTHON3_GW4XXX_GPS_CTRL_VERSION		:= 0.1.2
PYTHON3_GW4XXX_GPS_CTRL_MD5		:= cb03acc0868349df2b70a63bb4595ecb
PYTHON3_GW4XXX_GPS_CTRL			:= gw4xxx-gps-ctrl-$(PYTHON3_GW4XXX_GPS_CTRL_VERSION)
PYTHON3_GW4XXX_GPS_CTRL_SUFFIX		:= tar.gz
PYTHON3_GW4XXX_GPS_CTRL_URL		:=  http://172.17.0.1:8080/iotmaxx/$(PYTHON3_GW4XXX_GPS_CTRL).$(PYTHON3_GW4XXX_GPS_CTRL_SUFFIX)
PYTHON3_GW4XXX_GPS_CTRL_SOURCE		:= $(SRCDIR)/$(PYTHON3_GW4XXX_GPS_CTRL).$(PYTHON3_GW4XXX_GPS_CTRL_SUFFIX)
PYTHON3_GW4XXX_GPS_CTRL_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_GPS_CTRL)
PYTHON3_GW4XXX_GPS_CTRL_LICENSE		:= unknown
PYTHON3_GW4XXX_GPS_CTRL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_GPS_CTRL_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_GPS_CTRL)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_GPS_CTRL_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_GPS_CTRL_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_GPS_CTRL_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-gps-ctrl.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_GPS_CTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gps-ctrl.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_GPS_CTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gps-ctrl.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_GPS_CTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-gps-ctrl.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-gps-ctrl)
	@$(call install_fixup, python3-gw4xxx-gps-ctrl,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-gps-ctrl,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-gps-ctrl,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-gps-ctrl,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-gps-ctrl, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw4xxx-gps-ctrl)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gps-ctrl.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_GPS_CTRL)

# vim: syntax=make
