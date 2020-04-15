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
IMAGE_PACKAGES-$(PTXCONF_IMAGE_GATEWAY) += image-gateway

#
# Paths and names
#
IMAGE_GATEWAY		:= image-gateway
IMAGE_GATEWAY_DIR	:= $(BUILDDIR)/$(IMAGE_GATEWAY)
IMAGE_GATEWAY_IMAGE	:= $(IMAGEDIR)/gateway.hdimg
IMAGE_GATEWAY_FILES	:= $(IMAGEDIR)/root.tgz
IMAGE_GATEWAY_CONFIG	:= gateway.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_GATEWAY_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_GATEWAY)
	@$(call finish)

# vim: syntax=make
