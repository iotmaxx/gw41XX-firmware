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
PACKAGES-$(PTXCONF_PYTHON3_MODBUS_SERVER) += python3-modbus-server

#
# Paths and names
#
PYTHON3_MODBUS_SERVER_VERSION	:= 0.2.0
PYTHON3_MODBUS_SERVER_MD5	:= 97152d17a8409308e3969f9a0ea31a9d
PYTHON3_MODBUS_SERVER		:= modbus-server-$(PYTHON3_MODBUS_SERVER_VERSION)
PYTHON3_MODBUS_SERVER_SUFFIX	:= tar.gz
PYTHON3_MODBUS_SERVER_URL	:= http://172.17.0.1:8080/iotmaxx/$(PYTHON3_MODBUS_SERVER).$(PYTHON3_MODBUS_SERVER_SUFFIX)
PYTHON3_MODBUS_SERVER_SOURCE	:= $(SRCDIR)/$(PYTHON3_MODBUS_SERVER).$(PYTHON3_MODBUS_SERVER_SUFFIX)
PYTHON3_MODBUS_SERVER_DIR	:= $(BUILDDIR)/$(PYTHON3_MODBUS_SERVER)
PYTHON3_MODBUS_SERVER_LICENSE	:= unknown
PYTHON3_MODBUS_SERVER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_MODBUS_SERVER_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_MODBUS_SERVER)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_MODBUS_SERVER_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_MODBUS_SERVER_CONF_TOOL	:= python3
#PYTHON3_MODBUS_SERVER_CONF_OPT	:= 

#$(STATEDIR)/python3-modbus-server.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_MODBUS_SERVER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-modbus-server.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_MODBUS_SERVER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-modbus-server.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_MODBUS_SERVER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-modbus-server.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-modbus-server)
	@$(call install_fixup, python3-modbus-server,PRIORITY,optional)
	@$(call install_fixup, python3-modbus-server,SECTION,base)
	@$(call install_fixup, python3-modbus-server,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-modbus-server,DESCRIPTION,missing)

	@$(call install_copy, python3-modbus-server, 0, 0, 0755, $(PYTHON3_MODBUS_SERVER_DIR)/root/etc/rc.once.d/modbus_server_create_service,\
		 /etc/rc.once.d/modbus_server_create_service)
	@$(call install_glob, python3-modbus-server, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

#	@$(call install_copy, python3-modbus-server, 0, 0, 0755, $(PYTHON3_MODBUS_SERVER_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-modbus-server)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-modbus-server.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_MODBUS_SERVER)

# vim: syntax=make
