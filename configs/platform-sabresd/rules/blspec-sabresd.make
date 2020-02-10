# -*-makefile-*-
#
# Copyright (C) 2020 by Steffen Trumtrar <s.trumtrar@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BLSPEC_SABRESD) += blspec-sabresd

BLSPEC_SABRESD_VERSION		   := 5.5

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/blspec-sabresd.targetinstall:
	@$(call targetinfo)

	@$(call install_init, blspec-sabresd)
	@$(call install_fixup,blspec-sabresd,PRIORITY,optional)
	@$(call install_fixup,blspec-sabresd,SECTION,base)
	@$(call install_fixup,blspec-sabresd,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,blspec-sabresd,DESCRIPTION,missing)

	@$(call install_alternative, blspec-sabresd, 0, 0, 0644, \
		/loader/entries/sabresd.conf)

	@$(call install_finish,blspec-sabresd)

	@$(call touch)

# vim: syntax=make
