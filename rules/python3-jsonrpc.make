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
PACKAGES-$(PTXCONF_PYTHON3_JSONRPC) += python3-jsonrpc

#
# Paths and names
#
PYTHON3_JSONRPC_VERSION	:= 0.1.0
PYTHON3_JSONRPC_MD5	:= 088baa733577b7eb59b6eb6fd108c26f
PYTHON3_JSONRPC		:= jsonrpc-$(PYTHON3_JSONRPC_VERSION)
PYTHON3_JSONRPC_SUFFIX	:= tar.gz
PYTHON3_JSONRPC_URL	:= https://api.github.com/repos/iotmaxx/jsonrpc/tarball/$(PYTHON3_JSONRPC_VERSION)
PYTHON3_JSONRPC_SOURCE	:= $(SRCDIR)/$(PYTHON3_JSONRPC).$(PYTHON3_JSONRPC_SUFFIX)
PYTHON3_JSONRPC_DIR	:= $(BUILDDIR)/$(PYTHON3_JSONRPC)
PYTHON3_JSONRPC_LICENSE	:= unknown
PYTHON3_JSONRPC_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(PYTHON3_JSONRPC_SOURCE):
	@$(call targetinfo)
	@$(call gh_token_get, PYTHON3_JSONRPC)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------
$(STATEDIR)/python3-jsonrpc.extract:
	@$(call targetinfo)
	@$(call clean, $(PYTHON3_JSONRPC_DIR))
	@$(call gh_token_extract, PYTHON3_JSONRPC)
	@$(call patchin, $(PYTHON3_JSONRPC))
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_JSONRPC_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jsonrpc.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jsonrpc)
	@$(call install_fixup, python3-jsonrpc,PRIORITY,optional)
	@$(call install_fixup, python3-jsonrpc,SECTION,base)
	@$(call install_fixup, python3-jsonrpc,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-jsonrpc,DESCRIPTION,missing)

	@$(call install_glob, python3-jsonrpc, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-jsonrpc)

	@$(call touch)

# vim: syntax=make
