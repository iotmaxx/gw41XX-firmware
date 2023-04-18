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
PACKAGES-$(PTXCONF_WEBCONFIG) += webconfig

WEBCONFIG_VERSION	:= 1.4.0
WEBCONFIG_SUFFIX	:= tar.bz2
WEBCONFIG		:= webconfig_$(WEBCONFIG_VERSION).$(WEBCONFIG_SUFFIX)
WEBCONFIG_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.compile:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/webconfig.targetinstall:
	@$(call targetinfo)

	@$(call install_init, webconfig)
	@$(call install_fixup,webconfig,PRIORITY,optional)
	@$(call install_fixup,webconfig,SECTION,base)
	@$(call install_fixup,webconfig,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,webconfig,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_alternative, webconfig, 0, 0, 0644, /etc/foobar)
#	@$(call install_archive, webconfig, 0, 0, $(PTXDIST_WORKSPACE)/local_src/webconfig/$(WEBCONFIG), /)
	@$(call install_archive, webconfig, 0, 0, local_src/webconfig/$(WEBCONFIG), /)
	@$(call install_link, webconfig, /etc/systemd/system/webconfig.service, /etc/systemd/system/multi-user.target.wants/webconfig.service)
	@$(call install_copy, webconfig, 0, 0, 755, /var/lib/dnsmasq)

	@$(call install_finish,webconfig)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, WEBCONFIG)

# vim: syntax=make
