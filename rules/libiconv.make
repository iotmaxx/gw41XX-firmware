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
PACKAGES-$(PTXCONF_LIBICONV) += libiconv

#
# Paths and names
#
LIBICONV_VERSION	:= 1.16
LIBICONV_MD5		:= 7d2a800b952942bb2880efb00cfd524c
LIBICONV		:= libiconv-$(LIBICONV_VERSION)
LIBICONV_SUFFIX		:= tar.gz
LIBICONV_URL		:= $(PTXCONF_SETUP_GNUMIRROR)/libiconv/$(LIBICONV).$(LIBICONV_SUFFIX)
LIBICONV_SOURCE		:= $(SRCDIR)/$(LIBICONV).$(LIBICONV_SUFFIX)
LIBICONV_DIR		:= $(BUILDDIR)/$(LIBICONV)
LIBICONV_LICENSE	:= unknown
LIBICONV_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(LIBICONV_SOURCE):
#	@$(call targetinfo)
#	@$(call get, LIBICONV)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#LIBICONV_CONF_ENV	:= $(CROSS_ENV)

#
# autoconf
#
LIBICONV_CONF_TOOL	:= autoconf
#LIBICONV_CONF_OPT	:=  \
#	$(CROSS_AUTOCONF_USR)

#$(STATEDIR)/libiconv.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, LIBICONV)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/libiconv.compile:
#	@$(call targetinfo)
#	@$(call world/compile, LIBICONV)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/libiconv.install:
#	@$(call targetinfo)
#	@$(call world/install, LIBICONV)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libiconv.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libiconv)
	@$(call install_fixup, libiconv,PRIORITY,optional)
	@$(call install_fixup, libiconv,SECTION,base)
	@$(call install_fixup, libiconv,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, libiconv,DESCRIPTION,missing)

	@$(call install_copy, libiconv, 0, 0, 0755, $(LIBICONV_DIR)/foobar, /dev/null)

	@$(call install_finish, libiconv)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/libiconv.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, LIBICONV)

# vim: syntax=make
