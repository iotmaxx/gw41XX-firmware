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
PACKAGES-$(PTXCONF_HTC_9271_FIRMWARE) += htc_9271_firmware

HTC_9271_FIRMWARE_VERSION	:= 1.4.0
HTC_9271_FIRMWARE_MD5		:= c5b2dc29f7ec2f053169ada3b2ef70ae
HTC_9271_FIRMWARE		:= htc_9271-$(HTC_9271_FIRMWARE_VERSION)
HTC_9271_FIRMWARE_SUFFIX	:= fw
HTC_9271_FIRMWARE_URL		:= https://github.com/OpenELEC/wlan-firmware/raw/master/firmware/ath9k_htc/$(HTC_9271_FIRMWARE).$(HTC_9271_FIRMWARE_SUFFIX)
HTC_9271_FIRMWARE_SOURCE        := $(SRCDIR)/$(HTC_9271_FIRMWARE).$(HTC_9271_FIRMWARE_SUFFIX)
HTC_9271_FIRMWARE_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.compile:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/htc_9271_firmware.targetinstall:
	@$(call targetinfo)

	@$(call install_init, htc_9271_firmware)
	@$(call install_fixup,htc_9271_firmware,PRIORITY,optional)
	@$(call install_fixup,htc_9271_firmware,SECTION,base)
	@$(call install_fixup,htc_9271_firmware,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,htc_9271_firmware,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
	@$(call install_copy, htc_9271_firmware, 0, 0, 0644, $(HTC_9271_FIRMWARE_SOURCE),/lib/firmware/ath9k_htc/htc_9271-1.4.0.fw)
#	$(call install_copy, libgpiod, 0, 0, 0755, -, /usr/bin/$$tool)
	@$(call install_finish,htc_9271_firmware)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/htc_9271_firmware.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, HTC_9271_FIRMWARE)

# vim: syntax=make
