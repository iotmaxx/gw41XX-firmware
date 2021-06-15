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
IMAGE_PACKAGES-$(PTXCONF_IMAGE_GATEWAY_ROOT_CONFIG_TGZ) += image-gateway-root-config-tgz

#
# Paths and names
#
IMAGE_GATEWAY_ROOT_CONFIG_TGZ		:= image-gateway-root-config-tgz
IMAGE_GATEWAY_ROOT_CONFIG_TGZ_DIR	:= $(BUILDDIR)/$(IMAGE_GATEWAY_ROOT_CONFIG_TGZ)
IMAGE_GATEWAY_ROOT_CONFIG_TGZ_IMAGE	:= $(IMAGEDIR)/gateway-root-config.tgz
IMAGE_GATEWAY_ROOT_CONFIG_TGZ_PKGS	= $(PTX_PACKAGES_INSTALL)
IMAGE_GATEWAY_ROOT_CONFIG_TGZ_FILES	= 

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_GATEWAY_ROOT_CONFIG_TGZ_IMAGE):
	@$(call targetinfo)
	@$(call image/archive, IMAGE_GATEWAY_ROOT_CONFIG_TGZ)
	@$(call finish)

# vim: syntax=make
