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
PACKAGES-$(PTXCONF_ROOT_DATA2) += root-data2

ROOT_DATA2_VERSION	:= 0

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data2.compile:
	@$(call targetinfo)
	@mkdir -p $(PTXDIST_SYSROOT_TARGET)/data2
	@touch $(PTXDIST_SYSROOT_TARGET)/data2/.empty
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data2.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, root-data2)
	@$(call install_fixup,root-data2,PRIORITY,optional)
	@$(call install_fixup,root-data2,SECTION,base)
	@$(call install_fixup,root-data2,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,root-data2,DESCRIPTION,missing)

	@$(call install_copy, root-data2, 0, 0, 0755, $(PTXDIST_SYSROOT_TARGET)/data2/.empty, /data2/.empty)

	@$(call install_finish,root-data2)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-data1.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ROOT_DATA2)

# vim: syntax=make
