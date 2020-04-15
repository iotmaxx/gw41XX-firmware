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
PACKAGES-$(PTXCONF_BLSPEC_GATEWAY) += blspec-gateway

BLSPEC_GATEWAY_VERSION		   := 5.5

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/blspec-gateway.targetinstall:
	@$(call targetinfo)

	@$(call install_init, blspec-gateway)
	@$(call install_fixup,blspec-gateway,PRIORITY,optional)
	@$(call install_fixup,blspec-gateway,SECTION,base)
	@$(call install_fixup,blspec-gateway,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup,blspec-gateway,DESCRIPTION,missing)

	@$(call install_alternative, blspec-gateway, 0, 0, 0644, \
		/loader/entries/gateway.conf)

	@$(call install_finish,blspec-gateway)

	@$(call touch)

# vim: syntax=make
