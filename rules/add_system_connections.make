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
PACKAGES-$(PTXCONF_ADD_SYSTEM_CONNECTIONS) += add_system_connections

ADD_SYSTEM_CONNECTIONS_VERSION	:= 20210215
ADD_SYSTEM_CONNECTION_MD5	:=
ADD_SYSTEM_CONNECTION           := add_system_connections-$(ADD_SYSTEM_CONNECTIONS_VERSION)
#ADD_SYSTEM_CONNECTION_URL       := lndir://local_src/$(ADD_SYSTEM_CONNECTION)
#ADD_SYSTEM_CONNECTION_DIR 	:= $(BUILDDIR)/$(ADD_SYSTEM_CONNECTION)
ADD_SYSTEM_CONNECTION_DIR       := local_src/$(ADD_SYSTEM_CONNECTION)
ADD_SYSTEM_CONNECTIONS_LICENSE  := unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

ADD_SYSTEM_CONNECTION_CONF_TOOL  := NO
ADD_SYSTEM_CONNECTION_MAKE_ENV   := $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.compile:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/add_system_connections.targetinstall:
	@$(call targetinfo)

	@$(call install_init, add_system_connections)
	@$(call install_fixup,add_system_connections,PRIORITY,optional)
	@$(call install_fixup,add_system_connections,SECTION,base)
	@$(call install_fixup,add_system_connections,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,add_system_connections,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_alternative, add_system_connections, 0, 0, 0755, /usr/bin/add_system_connections)
	@$(call install_copy, add_system_connections, 0, 0, 0755, $(ADD_SYSTEM_CONNECTION_DIR)/add_system_connections, \
                /usr/bin/add_system_connections)

	@$(call install_copy, add_system_connections, 0, 0, 0600, $(ADD_SYSTEM_CONNECTION_DIR)/add_system_connections.service, \
                /etc/systemd/system/add_system_connections.service)
	@$(call install_link, add_system_connections, /etc/systemd/system/add_system_connections.service, /etc/systemd/system/multi-user.target.wants/add_system_connections.service)
	@$(call install_copy, add_system_connections, 0, 0, 0600, $(ADD_SYSTEM_CONNECTION_DIR)/wlan_ap.nmconnection.example, \
                /config/NetworkManager/system-connections/wlan_ap.nmconnection.example)

	@$(call install_finish,add_system_connections)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_system_connections.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ADD_SYSTEM_CONNECTIONS)

# vim: syntax=make
