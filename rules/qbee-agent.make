# -*-makefile-*-
#
# Copyright (C) 2025 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_QBEE_AGENT) += qbee-agent

#
# Paths and names
#
QBEE_AGENT_VERSION	:= 2024.50
QBEE_AGENT_MD5		:= 2a7089fddf002a6faa21e9395bd44c4d
QBEE_AGENT		:= qbee-agent-$(QBEE_AGENT_VERSION)
QBEE_AGENT_SUFFIX	:= tar.gz
QBEE_AGENT_URL		:= https://github.com/qbee-io/qbee-agent/releases/download/$(QBEE_AGENT_VERSION)/$(QBEE_AGENT).$(QBEE_AGENT_SUFFIX)
QBEE_AGENT_SOURCE	:= $(SRCDIR)/$(QBEE_AGENT).$(QBEE_AGENT_SUFFIX)
QBEE_AGENT_DIR		:= $(BUILDDIR)/$(QBEE_AGENT)
QBEE_AGENT_LICENSE	:= Apache-2.0
QBEE_AGENT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(QBEE_AGENT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, QBEE_AGENT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#QBEE_AGENT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
QBEE_AGENT_CONF_TOOL	:= NO
#QBEE_AGENT_CONF_OPT	:= 

#$(STATEDIR)/qbee-agent.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, QBEE_AGENT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/qbee-agent.compile:
	@$(call targetinfo)
##	@$(call world/compile, QBEE_AGENT)
#	@csplit -sz -f "$(QBEE_AGENT_DIR)/share/ssl/qbee-io-ca_" -b "%d.crt" $(QBEE_AGENT_DIR)/share/ssl/ca.cert '/.*BEGIN/' '{*}'
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qbee-agent.install:
	@$(call targetinfo)
##	@$(call world/install, QBEE_AGENT)
#	@$(call world/execute, QBEE_AGENT, \
#               install -d -m 0755 $(QBEE_AGENT_PKGDIR)/etc/ssl/certs)
#ifdef PTXCONF_CA_CERTIFICATES_BUNDLE
#	@cp $(CA_CERTIFICATES_PKGDIR)/etc/ssl/certs/ca-certificates.crt $(QBEE_AGENT_PKGDIR)/etc/ssl/certs/
#	@for crt in $(QBEE_AGENT_DIR)/share/ssl/*.crt; do \
#	sed -e '$$a\\' "$${crt}" >> \
#		$(QBEE_AGENT_PKGDIR)/etc/ssl/certs/ca-certificates.crt; \
#	done
#endif
# TODO(rgl) handle certificates as seperate files (s. ca-certificates rule)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qbee-agent.targetinstall:
	@$(call targetinfo)

	@$(call install_init, qbee-agent)
	@$(call install_fixup, qbee-agent,PRIORITY,optional)
	@$(call install_fixup, qbee-agent,SECTION,base)
	@$(call install_fixup, qbee-agent,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, qbee-agent,DESCRIPTION,missing)

	@$(call install_alternative, qbee-agent, 0, 0, 0644, /etc/systemd/system/qbee-agent.service)
	@$(call install_link, qbee-agent, /etc/systemd/system/qbee-agent.service, /etc/systemd/system/multi-user.target.wants/qbee-agent.service)
	@$(call install_copy, qbee-agent, 0, 0, 0755, $(QBEE_AGENT_DIR)/qbee-agent-arm, /usr/bin/qbee-agent)
#	@$(call install_tree, qbee-agent, 0, 0, -, /etc/ssl/certs)
	@$(call install_copy, qbee-agent, 0, 0, 0644, $(QBEE_AGENT_DIR)/share/ssl/ca.cert, /etc/qbee/ca.cert)

	@$(call install_finish, qbee-agent)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/qbee-agent.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, QBEE_AGENT)

# vim: syntax=make
