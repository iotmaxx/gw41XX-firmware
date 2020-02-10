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
IMAGE_PACKAGES-$(PTXCONF_IMAGE_SABRESD) += image-sabresd

#
# Paths and names
#
IMAGE_SABRESD		:= image-sabresd
IMAGE_SABRESD_DIR	:= $(BUILDDIR)/$(IMAGE_SABRESD)
IMAGE_SABRESD_IMAGE	:= $(IMAGEDIR)/sabresd.hdimg
IMAGE_SABRESD_FILES	:= $(IMAGEDIR)/root.tgz
IMAGE_SABRESD_CONFIG	:= sabresd.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_SABRESD_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_SABRESD)
	@$(call finish)

# vim: syntax=make
