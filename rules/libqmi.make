# -*-makefile-*-
#
# Copyright (C) 2015 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBQMI) += libqmi

#
# Paths and names
#
LIBQMI_VERSION	:= 1.30.4
LIBQMI_MD5	:= 10a99058cb3cc141a421342da60197f8
LIBQMI		:= libqmi-$(LIBQMI_VERSION)
LIBQMI_SUFFIX	:= tar.xz
LIBQMI_URL	:= http://www.freedesktop.org/software/libqmi/$(LIBQMI).$(LIBQMI_SUFFIX)
LIBQMI_SOURCE	:= $(SRCDIR)/$(LIBQMI).$(LIBQMI_SUFFIX)
LIBQMI_DIR	:= $(BUILDDIR)/$(LIBQMI)
LIBQMI_LICENSE	:= GPL-2.0-or-later AND LGPL-2.1-or-later
LIBQMI_LICENSE_FILES := \
	file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
	file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
LIBQMI_CONF_TOOL	:= autoconf
LIBQMI_CONF_OPT		:= \
	$(CROSS_AUTOCONF_USR) \
	--disable-compile-warnings \
	--disable-Werror \
	--disable-introspection \
	--enable-collection=full \
	--disable-firmware-update \
	--disable-mm-runtime-check \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-qmi-username \
	--$(call ptx/endis, PTXCONF_LIBQMI_MBIM_QMUX)-mbim-qmux \
	--disable-qrtr \
	--without-udev \
	--with-udev-base-dir=/usr/lib/udev

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libqmi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libqmi)
	@$(call install_fixup, libqmi,PRIORITY,optional)
	@$(call install_fixup, libqmi,SECTION,base)
	@$(call install_fixup, libqmi,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, libqmi,DESCRIPTION,missing)

	@$(call install_copy, libqmi, 0, 0, 0755, -, /usr/bin/qmicli)
	@$(call install_copy, libqmi, 0, 0, 0755, -, /usr/bin/qmi-network)

	@$(call install_copy, libqmi, 0, 0, 0755, -, /usr/libexec/qmi-proxy)
	@$(call install_lib, libqmi, 0, 0, 0644, libqmi-glib)

	@$(call install_finish, libqmi)

	@$(call touch)

# vim: syntax=make
