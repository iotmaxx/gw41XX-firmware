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
PACKAGES-$(PTXCONF_DOCKER_BIN) += docker-bin

DOCKER_BIN_VERSION	:= 23.0.1
DOCKER_BIN_MD5		:= 5c85bbe5c4228d77b73533029645fd87
DOCKER_BIN		:= docker-$(DOCKER_BIN_VERSION)
DOCKER_BIN_SUFFIX	:= tgz
DOCKER_BIN_URL		:= https://download.docker.com/linux/static/stable/armhf/$(DOCKER_BIN).$(DOCKER_BIN_SUFFIX)
DOCKER_BIN_DIR		:= $(BUILDDIR)/$(DOCKER_BIN)
DOCKER_BIN_SOURCE	:= $(SRCDIR)/$(DOCKER_BIN).$(DOCKER_BIN_SUFFIX)
DOCKER_BIN_LICENSE	:= Apache-2.0

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-bin.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-bin.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-bin.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/docker-bin.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/docker-bin.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/docker-bin.targetinstall:
	@$(call targetinfo)

	@$(call install_init, docker-bin)
	@$(call install_fixup,docker-bin,PRIORITY,optional)
	@$(call install_fixup,docker-bin,SECTION,base)
	@$(call install_fixup,docker-bin,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,docker-bin,DESCRIPTION,missing)

	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/containerd, /usr/bin/containerd)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/containerd-shim-runc-v2, /usr/bin/containerd-shim-runc-v2)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/ctr, /usr/bin/ctr)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/docker, /usr/bin/docker)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/docker-init, /usr/bin/docker-init)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/docker-proxy, /usr/bin/docker-proxy)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/runc, /usr/bin/runc)
	@$(call install_copy, docker-bin, 0, 0, 0755, $(DOCKER_BIN_DIR)/dockerd, /usr/bin/dockerd)

	@$(call install_alternative, docker-bin, 0, 0, 0644, /etc/systemd/system/docker.service)
	@$(call install_alternative, docker-bin, 0, 0, 0644, /etc/systemd/system/docker.socket)
	@$(call install_alternative, docker-bin, 0, 0, 0644, /etc/systemd/system/containerd.service)

	@$(call install_link, docker-bin, ../containerd.service, \
		/etc/systemd/system/multi-user.target.wants/containerd.service)
	@$(call install_link, docker-bin, ../docker.service, \
        	/etc/systemd/system/multi-user.target.wants/docker.service)

	@$(call install_finish,docker-bin)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/docker-bin.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, DOCKER_BIN)

# vim: syntax=make
