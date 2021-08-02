# -*-makefile-*-
#
# Copyright (C) 2012 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_GENIMAGE) += host-genimage

#https://github.com/rglaserIoT/genimage/releases/download/V14.1/genimage-14.1.tar.xz
#
# Paths and names
#
HOST_GENIMAGE_VERSION	:= 14.1
HOST_GENIMAGE_MD5	:= cf6bfe7cae9c4443eb6ee9716ef47533
HOST_GENIMAGE		:= genimage-$(HOST_GENIMAGE_VERSION)
HOST_GENIMAGE_SUFFIX	:= tar.xz
HOST_GENIMAGE_URL	:= https://github.com/rglaserIoT/genimage/releases/download/V$(HOST_GENIMAGE_VERSION)/$(HOST_GENIMAGE).$(HOST_GENIMAGE_SUFFIX)
HOST_GENIMAGE_SOURCE	:= $(SRCDIR)/$(HOST_GENIMAGE).$(HOST_GENIMAGE_SUFFIX)
HOST_GENIMAGE_DIR	:= $(HOST_BUILDDIR)/$(HOST_GENIMAGE)
HOST_GENIMAGE_LICENSE	:= GPL-2.0-only

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
HOST_GENIMAGE_CONF_TOOL	:= autoconf
HOST_GENIMAGE_CONF_OPT	:= \
	$(HOST_AUTOCONF) \
	--enable-largefile

# vim: syntax=make
