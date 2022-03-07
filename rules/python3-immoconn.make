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
PACKAGES-$(PTXCONF_PYTHON3_IMMOCONN) += python3-immoconn

#
# Paths and names
#
PYTHON3_IMMOCONN_VERSION	:= 0.4.17
PYTHON3_IMMOCONN_MD5		:= 8269ab20ae2c042b8a5d2b1956e7429e
PYTHON3_IMMOCONN		:= immoconn-$(PYTHON3_IMMOCONN_VERSION)
PYTHON3_IMMOCONN_SUFFIX		:= tar.gz
PYTHON3_IMMOCONN_URL		:= http://172.17.0.1:8080/iotmaxx/$(PYTHON3_IMMOCONN).$(PYTHON3_IMMOCONN_SUFFIX)
PYTHON3_IMMOCONN_SOURCE		:= $(SRCDIR)/$(PYTHON3_IMMOCONN).$(PYTHON3_IMMOCONN_SUFFIX)
PYTHON3_IMMOCONN_DIR		:= $(BUILDDIR)/$(PYTHON3_IMMOCONN)
PYTHON3_IMMOCONN_LICENSE	:= unknown
PYTHON3_IMMOCONN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_IMMOCONN_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_IMMOCONN)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_IMMOCONN_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_IMMOCONN_CONF_TOOL	:= python3
#PYTHON3_IMMOCONN_CONF_OPT	:= 

#$(STATEDIR)/python3-immoconn.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_IMMOCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-immoconn.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_IMMOCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-immoconn.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_IMMOCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-immoconn.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-immoconn)
	@$(call install_fixup, python3-immoconn,PRIORITY,optional)
	@$(call install_fixup, python3-immoconn,SECTION,base)
	@$(call install_fixup, python3-immoconn,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-immoconn,DESCRIPTION,missing)

	@$(call install_copy, python3-immoconn, 0, 0, 0755, $(PYTHON3_IMMOCONN_DIR)/root/etc/rc.once.d/gwmqtt_create_service, /etc/rc.once.d/gwmqtt_create_service)
	@$(call install_copy, python3-immoconn, 0, 0, 0755, $(PYTHON3_IMMOCONN_DIR)/root/etc/NetworkManager/dispatcher.d/10-restart-timesyncd, /etc/NetworkManager/dispatcher.d/10-restart-timesyncd)
	@$(call install_copy, python3-immoconn, 0, 0, 0644, $(PYTHON3_IMMOCONN_DIR)/root/etc/systemd/timesyncd.conf.d/10_juconn.conf, /etc/systemd/timesyncd.conf.d/10_juconn.conf)
	@$(call install_glob, python3-immoconn, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	
	@$(call install_finish, python3-immoconn)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-immoconn.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_IMMOCONN)

# vim: syntax=make
