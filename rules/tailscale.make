# -*-makefile-*-
#
# Copyright (C) 2024 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_TAILSCALE) += tailscale

#
# Paths and names
#
TAILSCALE_VERSION	:= 1.60.1
TAILSCALE_MD5		:= 40db55f40ef5fc9b999d35ea354364df
TAILSCALE		:= tailscale_$(TAILSCALE_VERSION)
TAILSCALE_SUFFIX	:= tar.gz
TAILSCALE_URL		:= https://github.com/tailscale/tailscale/archive/refs/tags/v$(TAILSCALE_VERSION).$(TAILSCALE_SUFFIX)
TAILSCALE_SOURCE	:= $(SRCDIR)/$(TAILSCALE).$(TAILSCALE_SUFFIX)
TAILSCALE_DIR		:= $(BUILDDIR)/$(TAILSCALE)
TAILSCALE_LICENSE	:= BSD-3-Clause
TAILSCALE_LICENSE_FILES	:= file://LICENSE;md5=a672713a9eb730050e491c92edf7984d

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(TAILSCALE_SOURCE):
#	@$(call targetinfo)
#	@$(call get, TAILSCALE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#TAILSCALE_CONF_ENV      := $(CROSS_ENV)
#
# python3
#
TAILSCALE_CONF_TOOL	:= NO
#TAILSCALE_CONF_OPT	:= 

#$(STATEDIR)/tailscale.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, TAILSCALE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/tailscale.compile:
	@$(call targetinfo)
#	@$(call world/compile, TAILSCALE)
	env GOOS=linux GOARCH=arm go build  -C $(TAILSCALE_DIR) -o tailscale_combined -tags ts_include_cli,ts_omit_aws,ts_omit_bird,ts_omit_tap,ts_omit_kube -ldflags "-w -s" ./cmd/tailscaled 
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tailscale.install:
	@$(call targetinfo)
#	@$(call world/install, TAILSCALE)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tailscale.targetinstall:
	@$(call targetinfo)

	@$(call install_init, tailscale)
	@$(call install_fixup, tailscale,PRIORITY,optional)
	@$(call install_fixup, tailscale,SECTION,base)
	@$(call install_fixup, tailscale,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, tailscale,DESCRIPTION,missing)

	@$(call install_copy, tailscale, 0, 0, 0755, /config/var/lib/tailscale)
	@$(call install_copy, tailscale, 0, 0, 0755, $(TAILSCALE_DIR)/tailscale_combined, /usr/bin/tailscale_combined)
	@$(call install_link, tailscale, /usr/bin/tailscale_combined, /usr/bin/tailscale)
	@$(call install_link, tailscale, /usr/bin/tailscale_combined, /usr/sbin/tailscaled)
#	@$(call install_copy, tailscale, 0, 0, 0755, $(TAILSCALE_DIR)/tailscaled, /usr/sbin/tailscaled)
#	@$(call install_copy, tailscale, 0, 0, 0755, $(TAILSCALE_DIR)/tailscale, /usr/bin/tailscale)
	@$(call install_copy, tailscale, 0, 0, 0755, $(TAILSCALE_DIR)/systemd/create_tsenv, /etc/rc.once.d/create_tsenv)
	@$(call install_copy, tailscale, 0, 0, 0600, $(TAILSCALE_DIR)/systemd/tailscaled.defaults, /config/etc/default/tailscaled/tailscaled)
	@$(call install_copy, tailscale, 0, 0, 0644, $(TAILSCALE_DIR)/systemd/tailscaled.service, /etc/systemd/system/tailscaled.service)
	@$(call install_link, tailscale, /etc/systemd/system/tailscaled.service, /etc/systemd/system/multi-user.target.wants/tailscaled.service)
	
	@$(call install_finish, tailscale)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/tailscale.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, TAILSCALE)

# vim: syntax=make
