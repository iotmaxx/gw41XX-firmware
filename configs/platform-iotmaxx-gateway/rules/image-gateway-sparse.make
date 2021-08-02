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
IMAGE_PACKAGES-$(PTXCONF_IMAGE_GATEWAY_SPARSE) += image-gateway-sparse

#
# Paths and names
#
IMAGE_GATEWAY_SPARSE		:= image-gateway-sparse
IMAGE_GATEWAY_SPARSE_DIR	:= $(BUILDDIR)/$(IMAGE_GATEWAY_SPARSE)
IMAGE_GATEWAY_SPARSE_IMAGE	:= $(IMAGEDIR)/gateway-sparse.hdimg
#IMAGE_GATEWAY_SPARSE_FILES	:= $(IMAGEDIR)/gateway.hdimg
IMAGE_GATEWAY_SPARSE_CONFIG	:= gateway-sparse.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_GATEWAY_SPARSE_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_GATEWAY_SPARSE)
	@$(call finish)

# vim: syntax=make
