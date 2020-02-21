# -*-makefile-*-
#
# Copyright (C) 2011 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_FIRMWARE) += firmware

FIRMWARE_VERSION	:= 1.0

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware.targetinstall:
	@$(call targetinfo)

	@$(call install_init, firmware)
	@$(call install_fixup,firmware,PRIORITY,optional)
	@$(call install_fixup,firmware,SECTION,base)
	@$(call install_fixup,firmware,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup,firmware,DESCRIPTION,missing)


	@$(call install_alternative, firmware, 0, 0, 0644, \
		/lib/firmware/imx/sdma/sdma-imx7d.bin)

	@$(call install_finish,firmware)

	@$(call touch)

# vim: syntax=make
