# -*-makefile-*-
#
# Copyright (C) 2021 by Niklas Sill <sill@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW_WEBINTERFACE) += python3-gw-webinterface

#
# Paths and names
#
PYTHON3_GW_WEBINTERFACE_VERSION	:= 0.2.2
PYTHON3_GW_WEBINTERFACE_MD5	:= 6839ca0a66a167f0f32983b2d01ed534
PYTHON3_GW_WEBINTERFACE		:= gw-backend
PYTHON3_GW_WEBINTERFACE_SUFFIX	:= zip
PYTHON3_GW_WEBINTERFACE_URL	:= https://github.com/iotmaxx/gw-webinterface/releases/download/$(PYTHON3_GW_WEBINTERFACE_VERSION)/$(PYTHON3_GW_WEBINTERFACE).$(PYTHON3_GW_WEBINTERFACE_SUFFIX)
PYTHON3_GW_WEBINTERFACE_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW_WEBINTERFACE).$(PYTHON3_GW_WEBINTERFACE_SUFFIX)
PYTHON3_GW_WEBINTERFACE_DIR	:= $(BUILDDIR)/$(PYTHON3_GW_WEBINTERFACE)
PYTHON3_GW_WEBINTERFACE_LICENSE	:= Apache


# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_GW_WEBINTERFACE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw-webinterface.prepare:
	@$(call targetinfo)
	@$(call world/prepare, PYTHON3_GW_WEBINTERFACE)
	@echo -e '[DEFAULT]\nlibrary_dirs =\ninclude_dirs =' > $(PYTHON3_GW_WEBINTERFACE_DIR)/site.cfg
	@$(call touch)



# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw-webinterface.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw-webinterface)
	@$(call install_fixup, python3-gw-webinterface, PRIORITY, optional)
	@$(call install_fixup, python3-gw-webinterface, SECTION, base)
	@$(call install_fixup, python3-gw-webinterface, AUTHOR, "Niklas Sill <sill@iotmaxx.de>")
	@$(call install_fixup, python3-gw-webinterface, DESCRIPTION, missing)

		@$(call install_glob, python3-gw-webinterface, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
		@$(call install_alternative, python3-gw-webinterface, 0, 0, 0644, \
		/etc/systemd/system/webinterface.service)
		@$(call install_link, python3-gw-webinterface, webinterface.service, \
		/etc/systemd/system/multi-user.target.wants/webinterface.service)

	@$(call install_finish, python3-gw-webinterface)

	@$(call touch)

# vim: syntax=make
