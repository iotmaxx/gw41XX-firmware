# -*-makefile-*-
#
# Copyright (C) 2021 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_ROOT_MNT_SDCARD) += root-mnt-sdcard

ROOT_MNT_SDCARD_VERSION	:= 0

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-mnt-sdcard.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-mnt-sdcard.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-mnt-sdcard.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/root-mnt-sdcard.compile:
	@$(call targetinfo)
#	@mkdir -p $(PTXDIST_SYSROOT_TARGET)/mnt/sdcard
#	@touch $(PTXDIST_SYSROOT_TARGET)/mnt/sdcard/.empty
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-mnt-sdcard.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/root-mnt-sdcard.targetinstall:
	@$(call targetinfo)

	@$(call install_init, root-mnt-sdcard)
	@$(call install_fixup,root-mnt-sdcard,PRIORITY,optional)
	@$(call install_fixup,root-mnt-sdcard,SECTION,base)
	@$(call install_fixup,root-mnt-sdcard,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,root-mnt-sdcard,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_copy, root-mnt-sdcard, 0, 0, 0644, $(PTXDIST_SYSROOT_TARGET)/mnt/sdcard/.empty, /mnt/sdcard/.empty)
	@$(call install_copy, root-mnt-sdcard, 0, 0, 0755, /mnt/sdcard)
	@$(call install_finish,root-mnt-sdcard)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/root-mnt-sdcard.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ROOT_MNT_SDCARD)

# vim: syntax=make
