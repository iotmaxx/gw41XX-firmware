# -*-makefile-*-
#
# Copyright (C) 2020 by Steffen Trumtrar <s.trumtrar@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_ROOT_CONFIG) += root-config

ROOT_CONFIG_VERSION	:= 0

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/root-config.compile:
	@$(call targetinfo)
	@mkdir -p $(PTXDIST_SYSROOT_TARGET)/config
	@touch $(PTXDIST_SYSROOT_TARGET)/config/.empty
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-config.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-config.targetinstall:
	@$(call targetinfo)
	@$(call install_init, root-config)
	@$(call install_fixup,root-config,PRIORITY,optional)
	@$(call install_fixup,root-config,SECTION,base)
	@$(call install_fixup,root-config,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,root-config,DESCRIPTION,missing)

	@$(call install_copy, root-config, 0, 0, 0644, $(PTXDIST_SYSROOT_TARGET)/config/.empty, /config/.empty)

	@$(call install_finish,root-config)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-config.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ROOT_CONFIG)

# vim: syntax=make
