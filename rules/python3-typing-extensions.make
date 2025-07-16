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
PACKAGES-$(PTXCONF_PYTHON3_TYPING_EXTENSIONS) += python3-typing-extensions

#
# Paths and names
#
PYTHON3_TYPING_EXTENSIONS_VERSION	:= 4.14.1
PYTHON3_TYPING_EXTENSIONS_MD5		:= da52c877660b1760771ce7553f729c5d
PYTHON3_TYPING_EXTENSIONS		:= typing_extensions-$(PYTHON3_TYPING_EXTENSIONS_VERSION)
PYTHON3_TYPING_EXTENSIONS_SUFFIX	:= tar.gz
PYTHON3_TYPING_EXTENSIONS_URL		:= $(call ptx/mirror-pypi, typing_extensions, $(PYTHON3_TYPING_EXTENSIONS).$(PYTHON3_TYPING_EXTENSIONS_SUFFIX))
PYTHON3_TYPING_EXTENSIONS_SOURCE	:= $(SRCDIR)/$(PYTHON3_TYPING_EXTENSIONS).$(PYTHON3_TYPING_EXTENSIONS_SUFFIX)
PYTHON3_TYPING_EXTENSIONS_DIR		:= $(BUILDDIR)/$(PYTHON3_TYPING_EXTENSIONS)
PYTHON3_TYPING_EXTENSIONS_LICENSE	:= PSF-2.0
PYTHON3_TYPING_EXTENSIONS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_TYPING_EXTENSIONS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_TYPING_EXTENSIONS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_TYPING_EXTENSIONS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_TYPING_EXTENSIONS_CONF_TOOL	:= python3
#PYTHON3_TYPING_EXTENSIONS_CONF_OPT	:= 

#$(STATEDIR)/python3-typing-extensions.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_TYPING_EXTENSIONS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-typing-extensions.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_TYPING_EXTENSIONS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-typing-extensions.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_TYPING_EXTENSIONS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-typing-extensions.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-typing-extensions)
	@$(call install_fixup, python3-typing-extensions,PRIORITY,optional)
	@$(call install_fixup, python3-typing-extensions,SECTION,base)
	@$(call install_fixup, python3-typing-extensions,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-typing-extensions,DESCRIPTION,missing)

	@$(call install_glob, python3-typing-extensions, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-typing-extensions)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-typing-extensions.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_TYPING_EXTENSIONS)

# vim: syntax=make
