# -*-makefile-*-
#
# Copyright (C) 2023 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_DOCKER_BIN) += docker_bin

#
# Paths and names
#
DOCKER_BIN_VERSION	:= 23.0.0
#DOCKER_BIN_MD5		:=
#DOCKER_BIN		:= 
#DOCKER_BIN_SUFFIX	:= tgz
#DOCKER_BIN_URL		:= https://download.docker.com/linux/static/stable/armhf/$(DOCKER_BIN).$(DOCKER_BIN_SUFFIX)
#DOCKER_BIN_SOURCE	:= $(SRCDIR)/$(DOCKER_BIN).$(DOCKER_BIN_SUFFIX)
#DOCKER_BIN_DIR		:= $(BUILDDIR)/$(DOCKER_BIN)
#DOCKER_BIN_LICENSE	:= unknown
#DOCKER_BIN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(DOCKER_BIN_SOURCE):
#	@$(call targetinfo)
#	@$(call get, DOCKER_BIN)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#DOCKER_BIN_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
#DOCKER_BIN_CONF_TOOL	:= NO
#DOCKER_BIN_CONF_OPT	:= 

#$(STATEDIR)/docker_bin.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, DOCKER_BIN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker_bin.compile:
#	@$(call targetinfo)
#	@$(call world/compile, DOCKER_BIN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker_bin.install:
#	@$(call targetinfo)
#	@$(call world/install, DOCKER_BIN)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/docker_bin.targetinstall:
	@$(call targetinfo)

	@$(call install_init, docker_bin)
	@$(call install_fixup, docker_bin,PRIORITY,optional)
	@$(call install_fixup, docker_bin,SECTION,base)
	@$(call install_fixup, docker_bin,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, docker_bin,DESCRIPTION,missing)

	@$(call install_alternative, docker_bin, 0, 0, 0644, \
		/etc/docker/daemon.json)
	@$(call install_alternative, docker_bin, 0, 0, 0755, \
		/etc/profile.d/adddocker2path.sh)
	@$(call install_finish, docker_bin)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker_bin.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, DOCKER_BIN)

# vim: syntax=make
