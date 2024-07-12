# -*-makefile-*-
#
# Copyright (C) 2024 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_PEEWEE) += python3-peewee

#
# Paths and names
#
PYTHON3_PEEWEE_VERSION	:= 3.17.6
PYTHON3_PEEWEE_MD5	:= 9160eec99700a6e64de082b62c913f88
PYTHON3_PEEWEE		:= peewee-$(PYTHON3_PEEWEE_VERSION)
PYTHON3_PEEWEE_SUFFIX	:= tar.gz
PYTHON3_PEEWEE_URL	:= $(call ptx/mirror-pypi, peewee, $(PYTHON3_PEEWEE).$(PYTHON3_PEEWEE_SUFFIX))
PYTHON3_PEEWEE_SOURCE	:= $(SRCDIR)/$(PYTHON3_PEEWEE).$(PYTHON3_PEEWEE_SUFFIX)
PYTHON3_PEEWEE_DIR	:= $(BUILDDIR)/$(PYTHON3_PEEWEE)
PYTHON3_PEEWEE_LICENSE	:= MIT
PYTHON3_PEEWEE_LICENSE_FILES	:= file://LICENSE;md5=8a68e3ec7a6e09a43370f0a3fbc48660

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PEEWEE_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PEEWEE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PEEWEE_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PEEWEE_CONF_TOOL	:= python3
#PYTHON3_PEEWEE_CONF_OPT	:= 

#$(STATEDIR)/python3-peewee.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PEEWEE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-peewee.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PEEWEE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-peewee.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PEEWEE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-peewee.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-peewee)
	@$(call install_fixup, python3-peewee,PRIORITY,optional)
	@$(call install_fixup, python3-peewee,SECTION,base)
	@$(call install_fixup, python3-peewee,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-peewee,DESCRIPTION,missing)

	@$(call install_glob, python3-peewee, 0, 0, -,  $(PYTHON3_SITEPACKAGES),, *.py)
#	@$(call install_copy, python3-peewee, 0, 0, 0755, $(PYTHON3_PEEWEE_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-peewee)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-peewee.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PEEWEE)

# vim: syntax=make
