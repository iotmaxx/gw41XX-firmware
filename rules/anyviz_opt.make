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
PACKAGES-$(PTXCONF_ANYVIZ_OPT) += anyviz_opt

#
# Paths and names
#
ANYVIZ_OPT_VERSION		:= 0.9.9.1
ANYVIZ_OPT			:= anyvizcloudadapter-MUSL-$(ANYVIZ_OPT_VERSION)
ANYVIZ_OPT_JSON			:= anyviz.json
ANYVIZ_OPT_SRC			:= local_src/anyviz
ANYVIZ_OPT_DIR         		:= $(BUILDDIR)/$(ANYVIZ_OPT)
# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(ANYVIZ_OPT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, ANYVIZ_OPT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#ANYVIZ_OPT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
#ANYVIZ_OPT_CONF_TOOL	:= python3
#ANYVIZ_OPT_CONF_OPT	:= 

#$(STATEDIR)/anyviz_opt.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, ANYVIZ_OPT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz_opt.compile:
	@$(call targetinfo)
#	@$(call world/compile, ANYVIZ_OPT)
	@mkdir -p $(ANYVIZ_OPT_DIR)
	@jq '.Anyviz.version = "$(ANYVIZ_OPT_VERSION)"' $(ANYVIZ_OPT_SRC)/anyviz.json > $(ANYVIZ_OPT_DIR)/anyviz.json
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz_opt.install:
	@$(call targetinfo)
#	@$(call world/install, ANYVIZ_OPT)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz_opt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, anyviz_opt)
	@$(call install_fixup, anyviz_opt,PRIORITY,optional)
	@$(call install_fixup, anyviz_opt,SECTION,base)
	@$(call install_fixup, anyviz_opt,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, anyviz_opt,DESCRIPTION,missing)

	@$(call install_copy, anyviz_opt, 0, 0, 0755, $(ANYVIZ_OPT_SRC)/$(ANYVIZ_OPT), /opt/bin/anyvizcloudadapter)
#	@jq '.Anyviz.version = "$(ANYVIZ_OPT_VERSION)"' $(ANYVIZ_OPT_SRC)/anyviz.json > $(ANYVIZ_OPT_DIR)/anyviz.json
	@$(call install_copy, anyviz_opt, 0, 0, 0444, $(ANYVIZ_OPT_DIR)/$(ANYVIZ_OPT_JSON), /config/iot_launcher.d/$(ANYVIZ_OPT_JSON))

	@$(call install_link, anyviz_opt, ttymxc2, /dev/RS232)
	@$(call install_link, anyviz_opt, ttymxc3, /dev/RS485)
	@$(call install_copy, anyviz_opt, 0, 0, 0755, /config/anyviz)
	@$(call install_link, anyviz_opt, /config/anyviz, /etc/anyviz)
	@$(call install_copy, anyviz_opt, 0, 0, 0755, /var/log/anyviz)

	@$(call install_finish, anyviz_opt)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/anyviz_opt.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ANYVIZ_OPT)

# vim: syntax=make
