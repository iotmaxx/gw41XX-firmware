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
PACKAGES-$(PTXCONF_ROOT_DATA1) += root-data1

ROOT_DATA1_VERSION	:= 0

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data1.compile:
	@$(call targetinfo)
	@mkdir -p $(PTXDIST_SYSROOT_TARGET)/data
	@touch $(PTXDIST_SYSROOT_TARGET)/data/.empty
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data1.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-data1.targetinstall:
	@$(call targetinfo)

	@$(call install_init, root-data1)
	@$(call install_fixup,root-data1,PRIORITY,optional)
	@$(call install_fixup,root-data1,SECTION,base)
	@$(call install_fixup,root-data1,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,root-data1,DESCRIPTION,missing)

	@$(call install_copy, root-data1, 0, 0, 0755, $(PTXDIST_SYSROOT_TARGET)/data/.empty, /data/.empty)

	@$(call install_finish,root-data1)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-data1.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ROOT_DATA1)

# vim: syntax=make
