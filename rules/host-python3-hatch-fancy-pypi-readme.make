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
HOST_PACKAGES-$(PTXCONF_HOST_PYTHON3_HATCH_FANCY_PYPI_README) += host-python3-hatch-fancy-pypi-readme

#
# Paths and names
#
HOST_PYTHON3_HATCH_FANCY_PYPI_README_VERSION	:= 25.1.0
HOST_PYTHON3_HATCH_FANCY_PYPI_README_MD5	:= 8e1ed2416887685adc1c909ed4fb63cb
HOST_PYTHON3_HATCH_FANCY_PYPI_README		:= hatch_fancy_pypi_readme-$(HOST_PYTHON3_HATCH_FANCY_PYPI_README_VERSION)
HOST_PYTHON3_HATCH_FANCY_PYPI_README_SUFFIX	:= tar.gz
HOST_PYTHON3_HATCH_FANCY_PYPI_README_URL	:= $(call ptx/mirror-pypi, hatch-fancy-pypi-readme, $(HOST_PYTHON3_HATCH_FANCY_PYPI_README).$(HOST_PYTHON3_HATCH_FANCY_PYPI_README_SUFFIX))
HOST_PYTHON3_HATCH_FANCY_PYPI_README_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_HATCH_FANCY_PYPI_README).$(HOST_PYTHON3_HATCH_FANCY_PYPI_README_SUFFIX)
HOST_PYTHON3_HATCH_FANCY_PYPI_README_DIR	:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_HATCH_FANCY_PYPI_README)
HOST_PYTHON3_HATCH_FANCY_PYPI_README_LICENSE	:= MIT
HOST_PYTHON3_HATCH_FANCY_PYPI_README_LICENSE_FILES	:= file://LICENSE.txt;md5=ba5633c60bd3e243091013aa83b4d807

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(HOST_PYTHON3_HATCH_FANCY_PYPI_README_SOURCE):
#	@$(call targetinfo)
#	@$(call get, HOST_PYTHON3_HATCH_FANCY_PYPI_README)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#HOST_PYTHON3_HATCH_FANCY_PYPI_README_CONF_ENV	:= $(HOST_ENV)

#
# python3
#
HOST_PYTHON3_HATCH_FANCY_PYPI_README_CONF_TOOL	:= python3
#HOST_PYTHON3_HATCH_FANCY_PYPI_README_CONF_OPT	:= 

#$(STATEDIR)/host-python3-hatch-fancy-pypi-readme.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, HOST_PYTHON3_HATCH_FANCY_PYPI_README)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-python3-hatch-fancy-pypi-readme.compile:
#	@$(call targetinfo)
#	@$(call world/compile, HOST_PYTHON3_HATCH_FANCY_PYPI_README)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-python3-hatch-fancy-pypi-readme.install:
#	@$(call targetinfo)
#	@$(call world/install, HOST_PYTHON3_HATCH_FANCY_PYPI_README)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-python3-hatch-fancy-pypi-readme.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, HOST_PYTHON3_HATCH_FANCY_PYPI_README)

# vim: syntax=make
