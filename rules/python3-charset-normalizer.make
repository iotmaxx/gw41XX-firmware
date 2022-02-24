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
PACKAGES-$(PTXCONF_PYTHON3_CHARSET_NORMALIZER) += python3-charset-normalizer

#
# Paths and names
#
PYTHON3_CHARSET_NORMALIZER_VERSION	:= 2.0.12
PYTHON3_CHARSET_NORMALIZER_MD5		:= f6664e0e90dbb3cc9cfc154a980f9864
PYTHON3_CHARSET_NORMALIZER		:= charset-normalizer-$(PYTHON3_CHARSET_NORMALIZER_VERSION)
PYTHON3_CHARSET_NORMALIZER_SUFFIX	:= tar.gz
PYTHON3_CHARSET_NORMALIZER_URL		:= $(call ptx/mirror-pypi, charset-normalizer, $(PYTHON3_CHARSET_NORMALIZER).$(PYTHON3_CHARSET_NORMALIZER_SUFFIX))
PYTHON3_CHARSET_NORMALIZER_SOURCE	:= $(SRCDIR)/$(PYTHON3_CHARSET_NORMALIZER).$(PYTHON3_CHARSET_NORMALIZER_SUFFIX)
PYTHON3_CHARSET_NORMALIZER_DIR		:= $(BUILDDIR)/$(PYTHON3_CHARSET_NORMALIZER)
PYTHON3_CHARSET_NORMALIZER_LICENSE	:= MIT
PYTHON3_CHARSET_NORMALIZER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_CHARSET_NORMALIZER_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_CHARSET_NORMALIZER)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_CHARSET_NORMALIZER_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_CHARSET_NORMALIZER_CONF_TOOL	:= python3
#PYTHON3_CHARSET_NORMALIZER_CONF_OPT	:= 

#$(STATEDIR)/python3-charset-normalizer.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_CHARSET_NORMALIZER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-charset-normalizer.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_CHARSET_NORMALIZER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-charset-normalizer.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_CHARSET_NORMALIZER)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-charset-normalizer.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-charset-normalizer)
	@$(call install_fixup, python3-charset-normalizer,PRIORITY,optional)
	@$(call install_fixup, python3-charset-normalizer,SECTION,base)
	@$(call install_fixup, python3-charset-normalizer,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-charset-normalizer,DESCRIPTION,missing)

#	@$(call install_copy, python3-charset-normalizer, 0, 0, 0755, $(PYTHON3_CHARSET_NORMALIZER_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-charset-normalizer, 0, 0, -, \
                $(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-charset-normalizer)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-charset-normalizer.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_CHARSET_NORMALIZER)

# vim: syntax=make
