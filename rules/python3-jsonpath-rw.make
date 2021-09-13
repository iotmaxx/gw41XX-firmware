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
PACKAGES-$(PTXCONF_PYTHON3_JSONPATH_RW) += python3-jsonpath-rw

#
# Paths and names
#
PYTHON3_JSONPATH_RW_VERSION	:= 1.4.0
PYTHON3_JSONPATH_RW_MD5		:= 3a807e05c2c12158fc6bb0a402fd5778
PYTHON3_JSONPATH_RW		:= jsonpath-rw-$(PYTHON3_JSONPATH_RW_VERSION)
PYTHON3_JSONPATH_RW_SUFFIX	:= tar.gz
PYTHON3_JSONPATH_RW_URL		:= https://files.pythonhosted.org/packages/71/7c/45001b1f19af8c4478489fbae4fc657b21c4c669d7a5a036a86882581d85/$(PYTHON3_JSONPATH_RW).$(PYTHON3_JSONPATH_RW_SUFFIX)
PYTHON3_JSONPATH_RW_SOURCE	:= $(SRCDIR)/$(PYTHON3_JSONPATH_RW).$(PYTHON3_JSONPATH_RW_SUFFIX)
PYTHON3_JSONPATH_RW_DIR		:= $(BUILDDIR)/$(PYTHON3_JSONPATH_RW)
PYTHON3_JSONPATH_RW_LICENSE	:= Apache-2.0
PYTHON3_JSONPATH_RW_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_JSONPATH_RW_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_JSONPATH_RW)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_JSONPATH_RW_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_JSONPATH_RW_CONF_TOOL	:= python3
#PYTHON3_JSONPATH_RW_CONF_OPT	:= 

#$(STATEDIR)/python3-jsonpath-rw.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_JSONPATH_RW)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonpath-rw.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_JSONPATH_RW)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonpath-rw.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_JSONPATH_RW)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jsonpath-rw.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jsonpath-rw)
	@$(call install_fixup, python3-jsonpath-rw,PRIORITY,optional)
	@$(call install_fixup, python3-jsonpath-rw,SECTION,base)
	@$(call install_fixup, python3-jsonpath-rw,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-jsonpath-rw,DESCRIPTION,missing)

#	@$(call install_copy, python3-jsonpath-rw, 0, 0, 0755, $(PYTHON3_JSONPATH_RW_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-jsonpath-rw, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)
	@$(call install_finish, python3-jsonpath-rw)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-jsonpath-rw.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_JSONPATH_RW)

# vim: syntax=make
