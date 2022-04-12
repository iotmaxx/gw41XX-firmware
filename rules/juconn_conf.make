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
PACKAGES-$(PTXCONF_JUCONN_CONF) += juconn_conf

JUCONN_CONF_VERSION	:= 20220315
JUCONN_CONF_LICENSE	:= unknown
JUCONN_CONF           	:= juconn-$(JUCONN_CONF_VERSION)
#JUCONN_CONF_URL       	:= lndir://local_src/$(JUCONN_CONF)
#JUCONN_CONF_DIR		:= $(BUILDDIR)/$(JUCONN_CONF)
JUCONN_CONF_SRC_DIR		:= local_src/$(JUCONN_CONF)

JUCONN_CONF_CONF_TOOL  	:= NO
#JUCONN_CONF_MAKE_ENV   	:= $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/juconn_conf.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/juconn_conf.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/juconn_conf.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/juconn_conf.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/juconn_conf.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/juconn_conf.targetinstall:
	@$(call targetinfo)

	@$(call install_init, juconn_conf)
	@$(call install_fixup,juconn_conf,PRIORITY,optional)
	@$(call install_fixup,juconn_conf,SECTION,base)
	@$(call install_fixup,juconn_conf,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,juconn_conf,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_alternative, juconn_conf, 0, 0, 0644, /etc/foobar)
	@$(call install_copy, juconn_conf, 0, 0, 0755, $(JUCONN_CONF_SRC_DIR)/etc/NetworkManager/dispatcher.d/10-restart-timesyncd, /etc/NetworkManager/dispatcher.d/10-restart-timesyncd)
	@$(call install_copy, juconn_conf, 0, 0, 0644, $(JUCONN_CONF_SRC_DIR)/etc/systemd/timesyncd.conf.d/10_juconn.conf, /etc/systemd/timesyncd.conf.d/10_juconn.conf)

	@$(call install_finish,juconn_conf)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/juconn_conf.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, JUCONN_CONF)

# vim: syntax=make
