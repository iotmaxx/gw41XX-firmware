# -*-makefile-*-
#
# Copyright (C) 2026 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BBCTRL) += bbctrl

#
# Paths and names
#
BBCTRL_VERSION	:= 0.1.0
BBCTRL_SUFFIX	:= tar.gz
BBCTRL		:= bbctrl-$(BBCTRL_VERSION).$(BBCTRL_SUFFIX)
BBCTRL_LICENSE	:= ignore

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(BBCTRL_SOURCE):
#	@$(call targetinfo)
#	@$(call get, BBCTRL)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#BBCTRL_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
#BBCTRL_CONF_TOOL	:= python3
#BBCTRL_CONF_OPT	:= 

#$(STATEDIR)/bbctrl.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, BBCTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/bbctrl.compile:
#	@$(call targetinfo)
#	@$(call world/compile, BBCTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/bbctrl.install:
#	@$(call targetinfo)
#	@$(call world/install, BBCTRL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/bbctrl.targetinstall:
	@$(call targetinfo)

	@$(call install_init, bbctrl)
	@$(call install_fixup, bbctrl,PRIORITY,optional)
	@$(call install_fixup, bbctrl,SECTION,base)
	@$(call install_fixup, bbctrl,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, bbctrl,DESCRIPTION,missing)

	@$(call install_archive, bbctrl, 0, 0, local_src/bbctrl/$(BBCTRL), /bin)
#	@$(call install_copy, bbctrl, 0, 0, 0755, $(BBCTRL_DIR)/foobar, /dev/null)

	@$(call install_finish, bbctrl)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/bbctrl.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, BBCTRL)

# vim: ft=make
