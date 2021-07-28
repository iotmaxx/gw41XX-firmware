# -*-makefile-*-
#
# Copyright (C) 2021 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_TEMPCONN) += tempconn

#
# Paths and names
#
TEMPCONN_VERSION	:= 0.9.12
TEMPCONN_MD5		:= 672be2bcc5c88812731b0e1549e37061
TEMPCONN		:= tempconn-$(TEMPCONN_VERSION)
TEMPCONN_SUFFIX		:= tar.gz
TEMPCONN_URL		:= http://172.17.0.1:8080/iotmaxx/$(TEMPCONN).$(TEMPCONN_SUFFIX)
TEMPCONN_SOURCE		:= $(SRCDIR)/$(TEMPCONN).$(TEMPCONN_SUFFIX)
TEMPCONN_DIR		:= $(BUILDDIR)/$(TEMPCONN)
TEMPCONN_LICENSE	:= unknown
TEMPCONN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(TEMPCONN_SOURCE):
#	@$(call targetinfo)
#	@$(call get, TEMPCONN)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#TEMPCONN_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
TEMPCONN_CONF_TOOL	:= python3
#TEMPCONN_CONF_OPT	:= 

#$(STATEDIR)/tempconn.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, TEMPCONN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/tempconn.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tempconn.install:
	@$(call targetinfo)
#	@$(call world/install, TEMPCONN)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tempconn.targetinstall:
	@$(call targetinfo)

	@$(call install_init, tempconn)
	@$(call install_fixup, tempconn,PRIORITY,optional)
	@$(call install_fixup, tempconn,SECTION,base)
	@$(call install_fixup, tempconn,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, tempconn,DESCRIPTION,missing)

	@$(call install_archive, tempconn, -, -, $(TEMPCONN_SOURCE), /)
	@$(call install_link, tempconn, /etc/systemd/system/tempconn.service, /etc/systemd/system/multi-user.target.wants/tempconn.service)

	@$(call install_finish, tempconn)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/tempconn.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, TEMPCONN)

# vim: syntax=make
