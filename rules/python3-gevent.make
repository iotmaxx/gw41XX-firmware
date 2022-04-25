# -*-makefile-*-
#
# Copyright (C) 2022 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GEVENT) += python3-gevent

#
# Paths and names
#
PYTHON3_GEVENT_VERSION	:= 21.12.0
PYTHON3_GEVENT_MD5	:= 84014946a25407706cbe9ecb088f1e9c
PYTHON3_GEVENT		:= gevent-$(PYTHON3_GEVENT_VERSION)
PYTHON3_GEVENT_SUFFIX	:= tar.gz
PYTHON3_GEVENT_URL	:= $(call ptx/mirror-pypi, gevent, $(PYTHON3_GEVENT).$(PYTHON3_GEVENT_SUFFIX))
PYTHON3_GEVENT_SOURCE	:= $(SRCDIR)/$(PYTHON3_GEVENT).$(PYTHON3_GEVENT_SUFFIX)
PYTHON3_GEVENT_DIR	:= $(BUILDDIR)/$(PYTHON3_GEVENT)
PYTHON3_GEVENT_LICENSE	:= MIT
PYTHON3_GEVENT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_GEVENT_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_GEVENT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_GEVENT_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GEVENT_CONF_TOOL	:= python3
#PYTHON3_GEVENT_CONF_OPT	:= --host

#$(STATEDIR)/python3-gevent.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GEVENT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gevent.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GEVENT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gevent.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GEVENT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gevent.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gevent)
	@$(call install_fixup, python3-gevent,PRIORITY,optional)
	@$(call install_fixup, python3-gevent,SECTION,base)
	@$(call install_fixup, python3-gevent,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gevent,DESCRIPTION,missing)

	@$(call install_copy, python3-gevent, 0, 0, 0755, $(PYTHON3_GEVENT_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-gevent)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gevent.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GEVENT)

# vim: syntax=make
