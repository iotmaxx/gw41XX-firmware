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
PACKAGES-$(PTXCONF_PYTHON3_PING3) += python3-ping3

#
# Paths and names
#
PYTHON3_PING3_VERSION	:= 4.0.8
PYTHON3_PING3_MD5	:= 67bca9d0ba0882f75fe7461d0cc88033
PYTHON3_PING3		:= ping3-$(PYTHON3_PING3_VERSION)
PYTHON3_PING3_SUFFIX	:= tar.gz
PYTHON3_PING3_URL	:= $(call ptx/mirror-pypi, ping3, $(PYTHON3_PING3).$(PYTHON3_PING3_SUFFIX))
PYTHON3_PING3_SOURCE	:= $(SRCDIR)/$(PYTHON3_PING3).$(PYTHON3_PING3_SUFFIX)
PYTHON3_PING3_DIR	:= $(BUILDDIR)/$(PYTHON3_PING3)
PYTHON3_PING3_LICENSE	:= MIT
PYTHON3_PING3_LICENSE_FILES	:= file://LICENSE;md5=3ae28ad230db5766d33276b580887102

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PING3_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PING3)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PING3_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PING3_CONF_TOOL	:= python3
#PYTHON3_PING3_CONF_OPT	:= 

#$(STATEDIR)/python3-ping3.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PING3)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-ping3.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PING3)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-ping3.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PING3)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-ping3.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-ping3)
	@$(call install_fixup, python3-ping3,PRIORITY,optional)
	@$(call install_fixup, python3-ping3,SECTION,base)
	@$(call install_fixup, python3-ping3,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-ping3,DESCRIPTION,missing)

	@$(call install_glob, python3-ping3, 0, 0, -,  $(PYTHON3_SITEPACKAGES),, *.py)
#	@$(call install_copy, python3-ping3, 0, 0, 0755, $(PYTHON3_PING3_DIR)/foobar, /dev/null)

	@$(call install_finish, python3-ping3)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-ping3.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PING3)

# vim: syntax=make
