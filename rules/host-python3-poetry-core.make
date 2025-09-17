# -*-makefile-*-
#
# Copyright (C) 2024 by Roland Hieber <rhi@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_PYTHON3_POETRY_CORE) += host-python3-poetry-core

#
# Paths and names
#
HOST_PYTHON3_POETRY_CORE_VERSION	:= 2.1.3
HOST_PYTHON3_POETRY_CORE_MD5		:= 5cee71d40e2a0dfb6d8afcba8536f110
HOST_PYTHON3_POETRY_CORE		:= poetry_core-$(HOST_PYTHON3_POETRY_CORE_VERSION)
HOST_PYTHON3_POETRY_CORE_SUFFIX		:= tar.gz
HOST_PYTHON3_POETRY_CORE_URL		:= $(call ptx/mirror-pypi, poetry_core, $(HOST_PYTHON3_POETRY_CORE).$(HOST_PYTHON3_POETRY_CORE_SUFFIX))
HOST_PYTHON3_POETRY_CORE_SOURCE		:= $(SRCDIR)/$(HOST_PYTHON3_POETRY_CORE).$(HOST_PYTHON3_POETRY_CORE_SUFFIX)
HOST_PYTHON3_POETRY_CORE_DIR		:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_POETRY_CORE)
HOST_PYTHON3_POETRY_CORE_LICENSE	:= MIT
HOST_PYTHON3_POETRY_CORE_LICENSE_FILES	:= \
	file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_POETRY_CORE_CONF_TOOL	:= python3

# vim: syntax=make
