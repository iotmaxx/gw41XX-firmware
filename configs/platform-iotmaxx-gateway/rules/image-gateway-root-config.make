# -*-makefile-*-
#
# Copyright (C) 2021 by Steffen Trumtrar <s.trumtrar@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
IMAGE_PACKAGES-$(PTXCONF_IMAGE_GATEWAY_ROOT_CONFIG) += image-gateway-root-config

#
# Paths and names
#
IMAGE_GATEWAY_ROOT_CONFIG	:= image-gateway-root-config
IMAGE_GATEWAY_ROOT_CONFIG_DIR	:= $(BUILDDIR)/$(IMAGE_GATEWAY_ROOT_CONFIG)
IMAGE_GATEWAY_ROOT_CONFIG_IMAGE	:= $(IMAGEDIR)/gateway-root-config.ext4
IMAGE_GATEWAY_ROOT_CONFIG_FILES	:= $(IMAGEDIR)/gateway-root-config.tgz
IMAGE_GATEWAY_ROOT_CONFIG_CONFIG := gateway-root-config.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_GATEWAY_ROOT_CONFIG_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_GATEWAY_ROOT_CONFIG)
	@$(call finish)

# vim: syntax=make
