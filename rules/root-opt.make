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
PACKAGES-$(PTXCONF_ROOT_OPT) += root-opt

ROOT_OPT_VERSION	:= 0

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/root-opt.compile:
	@$(call targetinfo)
	@mkdir -p $(PTXDIST_SYSROOT_TARGET)/opt
	@touch $(PTXDIST_SYSROOT_TARGET)/opt/.empty
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-opt.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-opt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, root-opt)
	@$(call install_fixup,root-opt,PRIORITY,optional)
	@$(call install_fixup,root-opt,SECTION,base)
	@$(call install_fixup,root-opt,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,root-opt,DESCRIPTION,missing)

	@$(call install_copy, root-opt, 0, 0, 0644, $(PTXDIST_SYSROOT_TARGET)/opt/.empty, /opt/.empty)

	@$(call install_finish,root-opt)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-opt.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ROOT_OPT)

# vim: syntax=make
