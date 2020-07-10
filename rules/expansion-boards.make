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
PACKAGES-$(PTXCONF_EXPANSION_BOARDS) += expansion-boards

#
# Paths and names
#
EXPANSION_BOARDS_VERSION	:= 0
EXPANSION_BOARDS		:= expansion-boards
EXPANSION_BOARDS_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(EXPANSION_BOARDS)
EXPANSION_BOARDS_DIR		:= $(BUILDDIR)/$(EXPANSION_BOARDS)
EXPANSION_BOARDS_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

EXPANSION_BOARDS_CONF_TOOL	:= NO

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/expansion-boards.compile:
	@$(call targetinfo)
	dtc -o $(EXPANSION_BOARDS_DIR)/test.dto \
		"$(shell ptxd_file_url_path "$(EXPANSION_BOARDS_URL)")/test.dts"
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/expansion-boards.install:
	@$(call targetinfo)
	@install -D -m644 $(EXPANSION_BOARDS_DIR)/test.dto \
		$(EXPANSION_BOARDS_PKGDIR)/boot/test.dto
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/expansion-boards.targetinstall:
	@$(call targetinfo)

	@$(call install_init, expansion-boards)
	@$(call install_fixup, expansion-boards,PRIORITY,optional)
	@$(call install_fixup, expansion-boards,SECTION,base)
	@$(call install_fixup, expansion-boards,AUTHOR,"Steffen Trumtrar <s.trumtrar@pengutronix.de>")
	@$(call install_fixup, expansion-boards,DESCRIPTION,missing)

	@$(call install_copy, expansion-boards, 0, 0, 0644, -, \
		/boot/test.dto)

	@$(call install_finish, expansion-boards)

	@$(call touch)

# vim: syntax=make
