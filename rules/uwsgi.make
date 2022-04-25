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
PACKAGES-$(PTXCONF_UWSGI) += uwsgi

#
# Paths and names
#
UWSGI_VERSION	:= 2.0.20
UWSGI_MD5		:= 0093ff2a06ad47f0b1a2f1a7944285c9
UWSGI		:= uwsgi-$(UWSGI_VERSION)
UWSGI_SUFFIX	:= tar.gz
UWSGI_URL		:= https://projects.unbit.it/downloads/$(UWSGI).$(UWSGI_SUFFIX)
UWSGI_SOURCE	:= $(SRCDIR)/$(UWSGI).$(UWSGI_SUFFIX)
UWSGI_DIR		:= $(BUILDDIR)/$(UWSGI)
UWSGI_LICENSE	:=  GPL-2.0-only
UWSGI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(UWSGI_SOURCE):
#	@$(call targetinfo)
#	@$(call get, UWSGI)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#UWSGI_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
UWSGI_CONF_TOOL	:= python3
#UWSGI_CONF_OPT	:= 

#$(STATEDIR)/uwsgi.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, UWSGI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/uwsgi.compile:
#	@$(call targetinfo)
#	@$(call world/compile, UWSGI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/uwsgi.install:
#	@$(call targetinfo)
#	@$(call world/install, UWSGI)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/uwsgi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, uwsgi)
	@$(call install_fixup, uwsgi,PRIORITY,optional)
	@$(call install_fixup, uwsgi,SECTION,base)
	@$(call install_fixup, uwsgi,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, uwsgi,DESCRIPTION,missing)

	@$(call install_copy, uwsgi, 0, 0, 0755, $(UWSGI_DIR)/foobar, /dev/null)

	@$(call install_finish, uwsgi)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/uwsgi.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, UWSGI)

# vim: syntax=make
