# -*-makefile-*-
#
# Copyright (C) 2020 by Oleksij Rempel <o.rempel@pengutronix.de> 
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_NETWORKD_CONFIG) += networkd-config

NETWORKD_CONFIG_VERSION	:= 1

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/networkd-config.targetinstall:
	@$(call targetinfo)

	@$(call install_init, networkd-config)
	@$(call install_fixup,networkd-config, PRIORITY, optional)
	@$(call install_fixup,networkd-config, SECTION, base)
	@$(call install_fixup,networkd-config, AUTHOR, "Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup,networkd-config, DESCRIPTION, missing)

	# install can
	@$(call install_alternative, networkd-config, 0, 0, 0644, \
		/etc/systemd/network/30-can.network)

	@$(call install_finish,networkd-config)

	@$(call touch)

# vim: syntax=make
