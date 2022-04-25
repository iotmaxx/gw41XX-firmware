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
PACKAGES-$(PTXCONF_PYTHON3_M2CRYPTO) += python3-m2crypto

#
# Paths and names
#
PYTHON3_M2CRYPTO_VERSION	:= 0.38.0
PYTHON3_M2CRYPTO_MD5		:= 8f39bfac730b6567e0c2179d15318c60
PYTHON3_M2CRYPTO		:= M2Crypto-$(PYTHON3_M2CRYPTO_VERSION)
PYTHON3_M2CRYPTO_SUFFIX		:= tar.gz
PYTHON3_M2CRYPTO_URL		:= $(call ptx/mirror-pypi, m2crypto, $(PYTHON3_M2CRYPTO).$(PYTHON3_M2CRYPTO_SUFFIX))
PYTHON3_M2CRYPTO_SOURCE		:= $(SRCDIR)/$(PYTHON3_M2CRYPTO).$(PYTHON3_M2CRYPTO_SUFFIX)
PYTHON3_M2CRYPTO_DIR		:= $(BUILDDIR)/$(PYTHON3_M2CRYPTO)
PYTHON3_M2CRYPTO_LICENSE	:= MIT
PYTHON3_M2CRYPTO_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_M2CRYPTO_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_M2CRYPTO)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_M2CRYPTO_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_M2CRYPTO_CONF_TOOL	:= python3
#PYTHON3_M2CRYPTO_CONF_OPT	:= 

#$(STATEDIR)/python3-m2crypto.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_M2CRYPTO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-m2crypto.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_M2CRYPTO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-m2crypto.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_M2CRYPTO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-m2crypto.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-m2crypto)
	@$(call install_fixup, python3-m2crypto,PRIORITY,optional)
	@$(call install_fixup, python3-m2crypto,SECTION,base)
	@$(call install_fixup, python3-m2crypto,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-m2crypto,DESCRIPTION,missing)

#	@$(call install_copy, python3-m2crypto, 0, 0, 0755, $(PYTHON3_M2CRYPTO_DIR)/foobar, /dev/null)
	@$(call install_glob, python3-m2crypto, 0, 0, -, $(PYTHON3_SITEPACKAGES),, *.py)
	@$(call install_finish, python3-m2crypto)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-m2crypto.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_M2CRYPTO)

# vim: syntax=make
