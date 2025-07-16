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
PACKAGES-$(PTXCONF_PYTHON3_PYSERIAL_ASYNCIO) += python3-pyserial-asyncio

#
# Paths and names
#
PYTHON3_PYSERIAL_ASYNCIO_VERSION	:= 0.6
PYTHON3_PYSERIAL_ASYNCIO_MD5		:= 409f32a35a3b530e6b2224e2a5b367da
PYTHON3_PYSERIAL_ASYNCIO		:= pyserial-asyncio-$(PYTHON3_PYSERIAL_ASYNCIO_VERSION)
PYTHON3_PYSERIAL_ASYNCIO_SUFFIX		:= tar.gz
PYTHON3_PYSERIAL_ASYNCIO_URL		:= $(call ptx/mirror-pypi, pyserial-asyncio, $(PYTHON3_PYSERIAL_ASYNCIO).$(PYTHON3_PYSERIAL_ASYNCIO_SUFFIX))
PYTHON3_PYSERIAL_ASYNCIO_SOURCE		:= $(SRCDIR)/$(PYTHON3_PYSERIAL_ASYNCIO).$(PYTHON3_PYSERIAL_ASYNCIO_SUFFIX)
PYTHON3_PYSERIAL_ASYNCIO_DIR		:= $(BUILDDIR)/$(PYTHON3_PYSERIAL_ASYNCIO)
PYTHON3_PYSERIAL_ASYNCIO_LICENSE	:= BSD-3-Clause
PYTHON3_PYSERIAL_ASYNCIO_LICENSE_FILES	:= file://LICENSE.txt;md5=9a79418f241689e78034391d51162d24

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_PYSERIAL_ASYNCIO_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_PYSERIAL_ASYNCIO)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_PYSERIAL_ASYNCIO_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_PYSERIAL_ASYNCIO_CONF_TOOL	:= python3
#PYTHON3_PYSERIAL_ASYNCIO_CONF_OPT	:= 

#$(STATEDIR)/python3-pyserial-asyncio.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_PYSERIAL_ASYNCIO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pyserial-asyncio.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_PYSERIAL_ASYNCIO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pyserial-asyncio.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_PYSERIAL_ASYNCIO)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyserial-asyncio.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyserial-asyncio)
	@$(call install_fixup, python3-pyserial-asyncio,PRIORITY,optional)
	@$(call install_fixup, python3-pyserial-asyncio,SECTION,base)
	@$(call install_fixup, python3-pyserial-asyncio,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-pyserial-asyncio,DESCRIPTION,missing)

	@$(call install_glob, python3-pyserial-asyncio, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-pyserial-asyncio)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-pyserial-asyncio.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_PYSERIAL_ASYNCIO)

# vim: syntax=make
