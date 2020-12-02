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
IMAGE_PACKAGES-$(PTXCONF_IMAGE_GATEWAY_DEVELOP) += image-gateway-develop

#
# Paths and names
#
IMAGE_GATEWAY_DEVELOP	:= image-gateway-develop
IMAGE_GATEWAY_DEVELOP_DIR	:= $(BUILDDIR)/$(IMAGE_GATEWAY_DEVELOP)
IMAGE_GATEWAY_DEVELOP_IMAGE	:= $(IMAGEDIR)/gateway-develop.hdimg
IMAGE_GATEWAY_DEVELOP_FILES	:= $(IMAGEDIR)/root.tgz
IMAGE_GATEWAY_DEVELOP_CONFIG	:= gateway-develop.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_GATEWAY_DEVELOP_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_GATEWAY_DEVELOP)
	@$(call finish)

# vim: syntax=make
