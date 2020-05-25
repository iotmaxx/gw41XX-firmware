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
PACKAGES-$(PTXCONF_PROJECTFILES) += projectfiles
PROJECTFILES_VERSION := 20200525

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/projectfiles.targetinstall:
	@$(call targetinfo)
	@$(call install_init, projectfiles)
	@$(call install_fixup, projectfiles, PRIORITY, optional)
	@$(call install_fixup, projectfiles, SECTION, base)
	@$(call install_fixup, projectfiles, AUTHOR, "Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup, projectfiles, DESCRIPTION, "Project specific files")

	# modem
	@$(call install_alternative, projectfiles, 0, 0, 0755, \
		/usr/bin/sim_setup.sh)

	@$(call install_finish, projectfiles)
	@$(call touch)

# vim: syntax=make
