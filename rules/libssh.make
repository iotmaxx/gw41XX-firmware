# -*-makefile-*-
#
# Copyright (C) 2021 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBSSH) += libssh

#
# Paths and names
#
LIBSSH_VERSION	:= 0.9.5
LIBSSH_MD5	:= 6211e47ba4dfd7f7e9f8a17a601245f4
LIBSSH		:= libssh-$(LIBSSH_VERSION)
LIBSSH_SUFFIX	:= tar.xz
LIBSSH_URL	:= https://www.libssh.org/files/0.9/$(LIBSSH).$(LIBSSH_SUFFIX)
LIBSSH_SOURCE	:= $(SRCDIR)/$(LIBSSH).$(LIBSSH_SUFFIX)
LIBSSH_DIR	:= $(BUILDDIR)/$(LIBSSH)
LIBSSH_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

LIBSSH_CONF_TOOL	:= cmake

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libssh.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libssh)
	@$(call install_fixup, libssh,PRIORITY,optional)
	@$(call install_fixup, libssh,SECTION,base)
	@$(call install_fixup, libssh,AUTHOR,"Marc Kleine-Budde <mkl@pengutronix.de>")
	@$(call install_fixup, libssh,DESCRIPTION,missing)

	@$(call install_lib, libssh, 0, 0, 0644, libssh)

	@$(call install_finish, libssh)

	@$(call touch)

# vim: syntax=make
