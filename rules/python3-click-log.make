# -*-makefile-*-
#
# Copyright (C) 2025 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_CLICK_LOG) += python3-click-log

#
# Paths and names
#
PYTHON3_CLICK_LOG_VERSION	:= 0.4.0
PYTHON3_CLICK_LOG_MD5		:= 5a0b43925fedada552c32cf5263be193
PYTHON3_CLICK_LOG		:= click-log-$(PYTHON3_CLICK_LOG_VERSION)
PYTHON3_CLICK_LOG_SUFFIX	:= tar.gz
PYTHON3_CLICK_LOG_URL		:= $(call ptx/mirror-pypi, click-log, $(PYTHON3_CLICK_LOG).$(PYTHON3_CLICK_LOG_SUFFIX))
PYTHON3_CLICK_LOG_SOURCE	:= $(SRCDIR)/$(PYTHON3_CLICK_LOG).$(PYTHON3_CLICK_LOG_SUFFIX)
PYTHON3_CLICK_LOG_DIR		:= $(BUILDDIR)/$(PYTHON3_CLICK_LOG)
PYTHON3_CLICK_LOG_LICENSE	:= MIT
PYTHON3_CLICK_LOG_LICENSE_FILES	:= file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CLICK_LOG_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CLICK_LOG)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CLICK_LOG_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CLICK_LOG_CONF_TOOL	:= python3
#PYTHON3_CLICK_LOG_CONF_OPT	:= 

#$(STATEDIR)/python3-click-log.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CLICK_LOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-click-log.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CLICK_LOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-click-log.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CLICK_LOG)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-click-log.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-click-log)
	@$(call install_fixup, python3-click-log,PRIORITY,optional)
	@$(call install_fixup, python3-click-log,SECTION,base)
	@$(call install_fixup, python3-click-log,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-click-log,DESCRIPTION,missing)

	@$(call install_glob, python3-click-log, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-click-log)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-click-log.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CLICK_LOG)

# vim: syntax=make
