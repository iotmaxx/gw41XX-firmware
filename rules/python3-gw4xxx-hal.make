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
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_HAL) += python3-gw4xxx-hal

#
# Paths and names
#
PYTHON3_GW4XXX_HAL_VERSION	:= 0.4.0
PYTHON3_GW4XXX_HAL_MD5		:= b9a56872d8d43b412adfd839bd03906c
#PYTHON3_GW4XXX_HAL		:= python3-gw4xxx-hal-$(PYTHON3_GW4XXX_HAL_VERSION)
PYTHON3_GW4XXX_HAL              := gw4xxx-hal-$(PYTHON3_GW4XXX_HAL_VERSION)
PYTHON3_GW4XXX_HAL_SUFFIX	:= tar.gz
#PYTHON3_GW4XXX_HAL_URL		:= https://github.com/iotmaxx/gw4xxx-hal/archive/$(PYTHON3_GW4XXX_HAL_VERSION)/$(PYTHON3_GW4XXX_HAL).$(PYTHON3_GW4XXX_HAL_SUFFIX)
#PYTHON3_GW4XXX_HAL_URL          := https://api.github.com/repos/iotmaxx/gw4xxx-hal/releases/$(PYTHON3_GW4XXX_HAL).$(PYTHON3_GW4XXX_HAL_SUFFIX)
PYTHON3_GW4XXX_HAL_URL          := https://api.github.com/repos/iotmaxx/gw4xxx-hal/tarball/$(PYTHON3_GW4XXX_HAL_VERSION)
PYTHON3_GW4XXX_HAL_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_HAL).$(PYTHON3_GW4XXX_HAL_SUFFIX)
PYTHON3_GW4XXX_HAL_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_HAL)
PYTHON3_GW4XXX_HAL_LICENSE	:= GPL-3.0-or-later
PYTHON3_GW4XXX_HAL_LICENSE_FILES	:= file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GW4XXX_HAL_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GW4XXX_HAL)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_HAL_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_HAL_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_HAL_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-hal.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_HAL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-hal.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_HAL)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-hal.install:
	@$(call targetinfo)
	@$(call world/install, PYTHON3_GW4XXX_HAL)
	@install -D -m 0755 $(PYTHON3_GW4XXX_HAL_DIR)/root/usr/sbin/usb-pwr-cycle.py \
                $(PYTHON3_GW4XXX_HAL_PKGDIR)/usr/sbin/usb-pwr-cycle.py
	@install -D -m 0644 $(PYTHON3_GW4XXX_HAL_DIR)/root/etc/systemd/system/ext_usb_reset.service \
                $(PYTHON3_GW4XXX_HAL_PKGDIR)/etc/systemd/system/ext_usb_reset.service
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-hal.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-hal)
	@$(call install_fixup, python3-gw4xxx-hal,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-hal,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-hal,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-hal,DESCRIPTION,missing)

	@$(call install_glob, python3-gw4xxx-hal, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py */tests)

	@$(call install_copy, python3-gw4xxx-hal, 0, 0, 0755, -, /usr/sbin/usb-pwr-cycle.py)
	@$(call install_copy, python3-gw4xxx-hal, 0, 0, 0644, -, /etc/systemd/system/ext_usb_reset.service)
	@$(call install_link, python3-gw4xxx-hal, /etc/systemd/system/ext_usb_reset.service, \
                /etc/systemd/system/basic.target.wants/ext_usb_reset.service)

	@$(call install_finish, python3-gw4xxx-hal)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-hal.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_HAL)

# vim: syntax=make
