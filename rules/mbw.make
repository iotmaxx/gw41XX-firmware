# -*-makefile-*-
#
# Copyright (C) 2008 by Robert Schwebel <r.schwebel@pengutronix.de>
#               2011 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_MBW) += mbw

#
# Paths and names
#
MBW_VERSION	:= 2.0
MBW_MD5		:= 46ca7401ae650734965e7a25453557d4
MBW		:= mbw-$(MBW_VERSION)
MBW_SUFFIX	:= tar.gz
MBW_URL		:= https://github.com/raas/mbw/archive/refs/tags/v$(MBW_VERSION)/$(MBW).$(MBW_SUFFIX)
MBW_SOURCE	:= $(SRCDIR)/$(MBW).$(MBW_SUFFIX)
MBW_DIR		:= $(BUILDDIR)/$(MBW)
MBW_LICENSE	:=  GPL-3.0-only
MBW_LICENSE_FILES := file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

MBW_CONF_TOOL	:= NO
MBW_MAKE_OPT	:= $(CROSS_ENV_PROGS)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/mbw.install:
	@$(call targetinfo)
	install -D -m644 $(MBW_DIR)/mbw $(MBW_PKGDIR)/usr/bin/mbw
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/mbw.targetinstall:
	@$(call targetinfo)

	@$(call install_init, mbw)
	@$(call install_fixup, mbw,PRIORITY,optional)
	@$(call install_fixup, mbw,SECTION,base)
	@$(call install_fixup, mbw,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, mbw,DESCRIPTION,missing)

	@$(call install_copy, mbw, 0, 0, 0755, -, /usr/bin/mbw)

	@$(call install_finish, mbw)

	@$(call touch)

# vim: syntax=make
