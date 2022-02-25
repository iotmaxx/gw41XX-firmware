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
PACKAGES-$(PTXCONF_PYTHON3_HEATCONN) += python3-heatconn

#
# Paths and names
#
PYTHON3_HEATCONN_VERSION	:= 0.6.0
PYTHON3_HEATCONN_MD5		:= a28ac867dd7a81b1047d4e602119c60c
PYTHON3_HEATCONN		:= heatconn-$(PYTHON3_HEATCONN_VERSION)
PYTHON3_HEATCONN_SUFFIX		:= tar.gz
PYTHON3_HEATCONN_URL		:=  http://172.17.0.1:8080/iotmaxx/$(PYTHON3_HEATCONN).$(PYTHON3_HEATCONN_SUFFIX)
PYTHON3_HEATCONN_SOURCE	:= $(SRCDIR)/$(PYTHON3_HEATCONN).$(PYTHON3_HEATCONN_SUFFIX)
PYTHON3_HEATCONN_DIR		:= $(BUILDDIR)/$(PYTHON3_HEATCONN)
PYTHON3_HEATCONN_LICENSE	:= unknown
PYTHON3_HEATCONN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_HEATCONN_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_HEATCONN)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_HEATCONN_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_HEATCONN_CONF_TOOL	:= python3
#PYTHON3_HEATCONN_CONF_OPT	:= 

#$(STATEDIR)/python3-heatconn.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_HEATCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-heatconn.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_HEATCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-heatconn.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_HEATCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-heatconn.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-heatconn)
	@$(call install_fixup, python3-heatconn,PRIORITY,optional)
	@$(call install_fixup, python3-heatconn,SECTION,base)
	@$(call install_fixup, python3-heatconn,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-heatconn,DESCRIPTION,missing)

#	@$(call install_copy, python3-heatconn, 0, 0, 0755, $(PYTHON3_HEATCONN_DIR)/foobar, /dev/null)
	@$(call install_copy, python3-heatconn, 0, 0, 0755, $(PYTHON3_HEATCONN_DIR)/root/etc/rc.once.d/heatconn_create_service, /etc/rc.once.d/heatconn_create_service)
	@$(call install_glob, python3-heatconn, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-heatconn)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-heatconn.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_HEATCONN)

# vim: syntax=make
