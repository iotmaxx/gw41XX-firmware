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
PACKAGES-$(PTXCONF_DOCKER_COMPOSE_BIN) += docker-compose-bin

DOCKER_COMPOSE_BIN_VERSION      := 2.16.0
DOCKER_COMPOSE_BIN_MD5          := 46e1c78175bed5921f8651a73c46e22a
DOCKER_COMPOSE_BIN              := docker-compose-linux-armv7
DOCKER_COMPOSE_BIN_URL          := https://github.com/docker/compose/releases/download/v$(DOCKER_COMPOSE_BIN_VERSION)/docker-compose-linux-armv7
#DOCKER_COMPOSE_BIN_DIR          := $(BUILDDIR)/$(DOCKER_BIN)
DOCKER_COMPOSE_BIN_SOURCE       := $(SRCDIR)/$(DOCKER_COMPOSE_BIN)
DOCKER_COMPOSE_BIN_LICENSE      := Apache-2.0

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.compile:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/docker-compose-bin.targetinstall:
	@$(call targetinfo)

	@$(call install_init, docker-compose-bin)
	@$(call install_fixup,docker-compose-bin,PRIORITY,optional)
	@$(call install_fixup,docker-compose-bin,SECTION,base)
	@$(call install_fixup,docker-compose-bin,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,docker-compose-bin,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
	@$(call install_copy, docker-compose-bin, 0, 0, 0755, $(DOCKER_COMPOSE_BIN_SOURCE), /usr/bin/docker-compose)
#	@$(call install_alternative, docker-compose-bin, 0, 0, 0644, /etc/foobar)

	@$(call install_finish,docker-compose-bin)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-compose-bin.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, DOCKER_COMPOSE_BIN)

# vim: syntax=make
