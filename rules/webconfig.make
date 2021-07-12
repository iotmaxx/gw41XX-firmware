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
PACKAGES-$(PTXCONF_WEBCONFIG) += webconfig

WEBCONFIG_VERSION	:= 1.0.7a
WEBCONFIG_MD5              := 7a81a5d7584fb40920833fbcbeedabe3
WEBCONFIG                  := webconfigd_$(WEBCONFIG_VERSION)
WEBCONFIG_SUFFIX           := tar.bz2
WEBCONFIG_URL              := http://172.17.0.1:8080/avantys/$(WEBCONFIG).$(WEBCONFIG_SUFFIX) # http://download.anyviz.io/anyviz/ARM/$(ANYVIZ)
WEBCONFIG_LICENSE	:= unknown
WEBCONFIG_DIR      := $(BUILDDIR)/$(WEBCONFIG)
WEBCONFIG_SOURCE   := $(SRCDIR)/$(WEBCONFIG).$(WEBCONFIG_SUFFIX)

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

$(STATEDIR)/webconfig.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/webconfig.install:
	@$(call targetinfo)
	@$(call touch)

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
	@$(call install_archive, webconfig, -, -, $(WEBCONFIG_SOURCE), /)
	@$(call install_link, webconfig, /etc/systemd/system/webconfig.service, /etc/systemd/system/multi-user.target.wants/webconfig.service)

	@$(call install_finish,webconfig)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/webconfig.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, WEBCONFIG)

# vim: syntax=make
