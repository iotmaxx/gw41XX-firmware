# -*-makefile-*-
#
# Copyright (C) 2021 by Roger Light <roger@atchoo.org>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_PAHO_MQTT) += python3-paho-mqtt

#
# Paths and names
#
PYTHON3_PAHO_MQTT_VERSION	:= 1.5.1
PYTHON3_PAHO_MQTT_MD5		:= 32f93c0ed92c7439f7a715ed258fd35d
PYTHON3_PAHO_MQTT		:= paho-mqtt-$(PYTHON3_PAHO_MQTT_VERSION)
PYTHON3_PAHO_MQTT_SUFFIX	:= tar.gz
PYTHON3_PAHO_MQTT_URL		:= https://files.pythonhosted.org/packages/32/d3/6dcb8fd14746fcde6a556f932b5de8bea8fedcb85b3a092e0e986372c0e7/$(PYTHON3_PAHO_MQTT).$(PYTHON3_PAHO_MQTT_SUFFIX)
PYTHON3_PAHO_MQTT_SOURCE	:= $(SRCDIR)/$(PYTHON3_PAHO_MQTT).$(PYTHON3_PAHO_MQTT_SUFFIX)
PYTHON3_PAHO_MQTT_DIR		:= $(BUILDDIR)/$(PYTHON3_PAHO_MQTT)
PYTHON3_PAHO_MQTT_LICENSE	:= EPL-1.0 and BSD-3-Clause
PYTHON3_PAHO_MQTT_LICENSE_FILES	:= file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PAHO_MQTT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PAHO_MQTT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PAHO_MQTT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PAHO_MQTT_CONF_TOOL	:= python3
#PYTHON3_PAHO_MQTT_CONF_OPT	:= 

#$(STATEDIR)/python3-paho-mqtt.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PAHO_MQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paho-mqtt.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PAHO_MQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paho-mqtt.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PAHO_MQTT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-paho-mqtt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-paho-mqtt)
	@$(call install_fixup, python3-paho-mqtt,PRIORITY,optional)
	@$(call install_fixup, python3-paho-mqtt,SECTION,base)
	@$(call install_fixup, python3-paho-mqtt,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-paho-mqtt,DESCRIPTION,missing)

#	@$(call install_copy, python3-paho-mqtt, 0, 0, 0755, $(PYTHON3_PAHO_MQTT_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-paho-mqtt, 0, 0, -, $(PYTHON3_SITEPACKAGES)/paho,, *.pyc)
#	@$(call install_glob, python3-paho-mqtt, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/paho-mqtt,,  *.pyc)

	@$(call install_finish, python3-paho-mqtt)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-paho-mqtt.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PAHO_MQTT)

# vim: syntax=make
