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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_GWMQTT) += python3-gw4xxx-gwmqtt

#
# Paths and names
#
PYTHON3_GW4XXX_GWMQTT_VERSION	:= 0.7.15
PYTHON3_GW4XXX_GWMQTT_MD5	:= a32687d45c07ffb3584d48e8ff7d1eef
PYTHON3_GW4XXX_GWMQTT		:= gw4xxx-gwmqtt-$(PYTHON3_GW4XXX_GWMQTT_VERSION)
PYTHON3_GW4XXX_GWMQTT_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_GWMQTT_URL	:= http://172.17.0.1:8080/iotmaxx/$(PYTHON3_GW4XXX_GWMQTT).$(PYTHON3_GW4XXX_GWMQTT_SUFFIX)
PYTHON3_GW4XXX_GWMQTT_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_GWMQTT).$(PYTHON3_GW4XXX_GWMQTT_SUFFIX)
PYTHON3_GW4XXX_GWMQTT_DIR	:= $(BUILDDIR)/$(PYTHON3_GW4XXX_GWMQTT)
PYTHON3_GW4XXX_GWMQTT_LICENSE	:= unknown
PYTHON3_GW4XXX_GWMQTT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_GWMQTT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_GWMQTT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_GWMQTT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_GWMQTT_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_GWMQTT_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-gwmqtt.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_GWMQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gwmqtt.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_GWMQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gwmqtt.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_GWMQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-gwmqtt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-gwmqtt)
	@$(call install_fixup, python3-gw4xxx-gwmqtt,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-gwmqtt,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-gwmqtt,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-gwmqtt,DESCRIPTION,missing)

	@$(call install_copy, python3-gw4xxx-gwmqtt, 0, 0, 0755, $(PYTHON3_GW4XXX_GWMQTT_DIR)/root/etc/rc.once.d/gwmqtt_create_service, /etc/rc.once.d/gwmqtt_create_service)
	@$(call install_glob, python3-gw4xxx-gwmqtt, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
#	@$(call install_copy, python3-gw4xxx-gwmqtt, 0, 0, 0755, $(PYTHON3_GW4XXX_GWMQTT_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-gw4xxx-gwmqtt)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-gwmqtt.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_GWMQTT)

# vim: syntax=make
