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
PYTHON3_JSONRPC_MD5	:= 7c446da571ceb60bc46eb30a33dfeeba
PYTHON3_JSONRPC		:= jsonrpc-$(PYTHON3_JSONRPC_VERSION)
PYTHON3_JSONRPC_SUFFIX	:= tar.gz
PYTHON3_JSONRPC_URL	:= http://172.17.0.1:8080/iotmaxx/$(PYTHON3_JSONRPC).$(PYTHON3_JSONRPC_SUFFIX)
PYTHON3_JSONRPC_SOURCE	:= $(SRCDIR)/$(PYTHON3_JSONRPC).$(PYTHON3_JSONRPC_SUFFIX)
PYTHON3_JSONRPC_DIR	:= $(BUILDDIR)/$(PYTHON3_JSONRPC)
PYTHON3_JSONRPC_LICENSE	:= unknown
PYTHON3_JSONRPC_LICENSE_FILES	:=

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
