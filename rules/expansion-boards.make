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

EXPANSION_BOARDS_OVERLAYS := test test2 sensexp01 testexp

$(STATEDIR)/expansion-boards.compile:
	@$(call targetinfo)
	# FIXME: use ptxdist wrappers
	@dtc -@ -o $(EXPANSION_BOARDS_DIR)/test.dto \
		"$(shell ptxd_file_url_path "$(EXPANSION_BOARDS_URL)")/test.dts"
	@dtc -@ -o $(EXPANSION_BOARDS_DIR)/test2.dto \
		"$(shell ptxd_file_url_path "$(EXPANSION_BOARDS_URL)")/test2.dts"
	@dtc -@ -o $(EXPANSION_BOARDS_DIR)/sensexp01.dto \
		"$(shell ptxd_file_url_path "$(EXPANSION_BOARDS_URL)")/sensexp01.dts"
	@dtc -o $(EXPANSION_BOARDS_DIR)/testexp.dto \
		"$(shell ptxd_file_url_path "$(EXPANSION_BOARDS_URL)")/testexp.dts"
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/expansion-boards.install:
	@$(call targetinfo)
	@install -D -m644 $(EXPANSION_BOARDS_DIR)/test.dto \
			$(EXPANSION_BOARDS_PKGDIR)/boot/test.dto
	@install -D -m644 $(EXPANSION_BOARDS_DIR)/test2.dto \
			$(EXPANSION_BOARDS_PKGDIR)/boot/test2.dto
	@install -D -m644 $(EXPANSION_BOARDS_DIR)/sensexp01.dto \
			$(EXPANSION_BOARDS_PKGDIR)/boot/sensexp01.dto
	@install -D -m644 $(EXPANSION_BOARDS_DIR)/testexp.dto \
			$(EXPANSION_BOARDS_PKGDIR)/boot/testexp.dto
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

	@$(foreach file,$(EXPANSION_BOARDS_OVERLAYS), \
		$(call install_copy, expansion-boards, 0, 0, 0644, -, /boot/$(file).dto);)

	@$(call install_finish, expansion-boards)

	@$(call touch)

# vim: syntax=make
