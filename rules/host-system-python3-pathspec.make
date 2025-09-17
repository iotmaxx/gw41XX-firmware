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
HOST_PACKAGES-$(PTXCONF_HOST_SYSTEM_PYTHON3_PATHSPEC) += host-system-python3-pathspec

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_SYSTEM_PYTHON3_PATHSPEC_CONF_TOOL := python3

# vim: syntax=make


